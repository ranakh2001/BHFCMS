import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/providers.dart';

// --- Profile State ---

class ProfileState {
  final bool notificationsEnabled;

  const ProfileState({this.notificationsEnabled = true});

  ProfileState copyWith({bool? notificationsEnabled}) {
    return ProfileState(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}

// --- Profile Notifier ---

class ProfileNotifier extends Notifier<ProfileState> {
  @override
  ProfileState build() {
    return const ProfileState();
  }

  void toggleNotifications(bool value) {
    state = state.copyWith(notificationsEnabled: value);
  }

  Future<void> changeLanguage(String langCode) async {
    await ref.read(localeProvider.notifier).updateLocale(langCode);
  }
}

final profileProvider =
    NotifierProvider<ProfileNotifier, ProfileState>(ProfileNotifier.new);
