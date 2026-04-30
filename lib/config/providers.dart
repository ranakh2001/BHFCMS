import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../core/network/auth_interceptor.dart';
import '../core/network/dio_client.dart';
import '../core/services/notification/notification_service.dart';
import '../core/storage/secure_storage_service.dart';
import '../core/storage/shared_preferences_service.dart';

// --- Storage Providers ---

// Needs to be overridden in main() before app start
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden');
});

final sharedPrefServiceProvider = Provider<SharedPreferencesService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesService(prefs);
});

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return SecureStorageService(secureStorage);
});

// --- Network Providers ---

final authInterceptorProvider = Provider<AuthInterceptor>((ref) {
  final secureStorage = ref.watch(secureStorageServiceProvider);
  return AuthInterceptor(secureStorage);
});

final dioClientProvider = Provider<DioClient>((ref) {
  final interceptor = ref.watch(authInterceptorProvider);
  return DioClient(interceptor);
});

// --- App Settings Notifiers ---

class ThemeModeNotifier extends Notifier<String> {
  @override
  String build() {
    return ref.watch(sharedPrefServiceProvider).themeMode;
  }

  Future<void> updateTheme(String mode) async {
    await ref.read(sharedPrefServiceProvider).setThemeMode(mode);
    state = mode;
  }
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, String>(ThemeModeNotifier.new);

class LocaleNotifier extends Notifier<String> {
  @override
  String build() {
    return ref.watch(sharedPrefServiceProvider).language;
  }

  Future<void> updateLocale(String langCode) async {
    await ref.read(sharedPrefServiceProvider).setLanguage(langCode);
    state = langCode;
  }
}

final localeProvider = NotifierProvider<LocaleNotifier, String>(LocaleNotifier.new);

// --- Notification Providers ---

/// Provides the singleton [NotificationService] instance.
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService.instance;
});

/// Resolves the current FCM device token asynchronously.
/// Use in UI with [ref.watch] to display or copy the token.
final fcmTokenProvider = FutureProvider<String?>((ref) async {
  return ref.watch(notificationServiceProvider).getToken();
});
