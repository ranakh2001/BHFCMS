import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers.dart';

enum NotificationPermissionStatus {
  unknown,           // never asked
  granted,           // authorized or provisional
  denied,            // just denied by the user
  permanentlyDenied, // was asked before and is still denied
}

class NotificationPermissionController
    extends AsyncNotifier<NotificationPermissionStatus> {
  @override
  Future<NotificationPermissionStatus> build() async {
    final prefs = ref.read(sharedPrefServiceProvider);
    if (!prefs.hasRequestedNotificationPermission) {
      return NotificationPermissionStatus.unknown;
    }
    final status =
        await ref.read(notificationServiceProvider).checkPermissionStatus();
    return _map(status, alreadyAskedBefore: true);
  }

  /// Shows the OS dialog once. Subsequent calls are no-ops (flag is persisted).
  Future<void> requestPermissionIfNeeded() async {
    final prefs = ref.read(sharedPrefServiceProvider);
    if (prefs.hasRequestedNotificationPermission) return;

    state = const AsyncLoading();
    try {
      final authStatus =
          await ref.read(notificationServiceProvider).requestOsPermission();
      await prefs.setNotificationPermissionRequested();
      state = AsyncData(_map(authStatus, alreadyAskedBefore: false));
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  NotificationPermissionStatus _map(
    AuthorizationStatus status, {
    required bool alreadyAskedBefore,
  }) {
    switch (status) {
      case AuthorizationStatus.authorized:
      case AuthorizationStatus.provisional:
        return NotificationPermissionStatus.granted;
      case AuthorizationStatus.denied:
        // If we've asked before and it's still denied, the user has to go to
        // Settings manually — treat it as permanently denied.
        return alreadyAskedBefore
            ? NotificationPermissionStatus.permanentlyDenied
            : NotificationPermissionStatus.denied;
      case AuthorizationStatus.notDetermined:
        return NotificationPermissionStatus.unknown;
    }
  }
}

final notificationPermissionControllerProvider = AsyncNotifierProvider<
    NotificationPermissionController, NotificationPermissionStatus>(
  NotificationPermissionController.new,
);
