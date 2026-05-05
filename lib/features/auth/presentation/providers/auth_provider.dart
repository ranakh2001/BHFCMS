import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/providers.dart';
import '../../../../core/network/dio_manager.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/user_role.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../data/sources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';

// ---------------------------------------------------------------------------
// Infrastructure providers
// ---------------------------------------------------------------------------

final authDataSourceProvider = Provider<AuthRemoteDataSource>(
  (_) => AuthRemoteDataSourceImpl(DioManager.instance),
);

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authDataSourceProvider),
    secureStorage: ref.watch(secureStorageServiceProvider),
    sharedPrefs: ref.watch(sharedPrefServiceProvider),
  );
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
});

// ---------------------------------------------------------------------------
// Auth state
// ---------------------------------------------------------------------------

class AuthState {
  final bool isLoading;
  final User? user;
  final String? error;

  const AuthState({
    this.isLoading = false,
    this.user,
    this.error,
  });

  bool get isAuthenticated => user != null;

  AuthState copyWith({
    bool? isLoading,
    User? user,
    String? error,
    bool clearUser = false,
    bool clearError = false,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: clearUser ? null : (user ?? this.user),
      error: clearError ? null : (error ?? this.error),
    );
  }
}

/// Non-auto-dispose: auth state lives for the entire app lifetime.
/// [build] kicks off the session restore immediately so [SplashScreen] can
/// react to [isLoading] → false and route accordingly.
class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    _restoreSession();
    return const AuthState(isLoading: true);
  }

  Future<void> _restoreSession() async {
    final user = await ref.read(authRepositoryProvider).checkAuthStatus();
    state = AuthState(isLoading: false, user: user);
    // Trigger a background refresh from the API when a cached session exists.
    if (user != null) {
      ref.invalidate(authUserProvider);
    }
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final user = await ref
          .read(loginUseCaseProvider)
          .execute(email, password);
      state = state.copyWith(isLoading: false, user: user);
      // Refresh full user profile from /auth-user now that a token exists.
      ref.invalidate(authUserProvider);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);
    try {
      await ref.read(authRepositoryProvider).logout();
    } catch (_) {
      // Storage clear failed — still force logout by resetting state.
    }
    ref.invalidate(authUserProvider);
    state = const AuthState(isLoading: false);
  }
}

final authNotifierProvider =
    NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

/// Convenience: non-null only when authenticated.
final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authNotifierProvider).user;
});

// ---------------------------------------------------------------------------
// Auth-user API providers
// ---------------------------------------------------------------------------

/// Fetches the current user's full profile from GET /auth-user.
///
/// Invalidated after login, logout, and session restore so callers always
/// get up-to-date data. Use `.when()` in widgets to handle loading/error.
final authUserProvider = FutureProvider<User>((ref) async {
  return ref.read(authRepositoryProvider).getAuthUser();
});

/// Convenience selector: the current [AccountType] from the API response.
///
/// Falls back to the cached auth state while [authUserProvider] is loading,
/// so role-based UI is available immediately without waiting for the network.
final accountTypeProvider = Provider<AccountType?>((ref) {
  return ref.watch(authUserProvider).valueOrNull?.accountType ??
      ref.watch(currentUserProvider)?.accountType;
});
