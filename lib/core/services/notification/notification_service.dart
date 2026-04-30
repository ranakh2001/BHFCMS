import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'fcm_background_handler.dart';

/// Central service for Firebase Cloud Messaging and local notifications.
/// Access via [NotificationService.instance].
class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // Android notification channel — must match AndroidManifest meta-data
  static const String channelId = 'bhcfms_high_importance';
  static const String channelName = 'BHCFMS Notifications';
  static const String _channelDescription =
      'High importance notifications for the BHCFMS app';

  String? _fcmToken;

  /// The current FCM device token (available after [initialize]).
  String? get fcmToken => _fcmToken;

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Call once from [main], after [Firebase.initializeApp].
  /// Permission is intentionally NOT requested here — use
  /// [NotificationPermissionController.requestPermissionIfNeeded] after
  /// navigation completes (e.g. in MainLayoutScreen.initState).
  Future<void> initialize() async {
    // Register background handler before anything else
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    await _initLocalNotifications();
    _listenForeground();
    _listenOpenedFromBackground();
    await _checkInitialMessage();
    await _initToken();
  }

  /// Returns the current FCM token, fetching it if not yet cached.
  Future<String?> getToken() async {
    _fcmToken ??= await _messaging.getToken();
    return _fcmToken;
  }

  /// Subscribe to an FCM topic (e.g. role-based broadcasts).
  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
    log('FCM: subscribed to topic "$topic"');
  }

  /// Unsubscribe from an FCM topic.
  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
    log('FCM: unsubscribed from topic "$topic"');
  }

  /// Send the FCM token to your backend.
  /// Wire up the actual HTTP call here once DioClient is available.
  Future<void> sendTokenToBackend(String token) async {
    // TODO: inject DioClient and POST to your device-registration endpoint
    // await dioClient.post('/api/devices/register', data: {'fcm_token': token});
    log('FCM: token ready for backend — $token');
  }

  // ---------------------------------------------------------------------------
  // Permissions
  // ---------------------------------------------------------------------------

  /// Shows the OS permission dialog and returns the resulting status.
  /// Called by [NotificationPermissionController] after navigation completes.
  Future<AuthorizationStatus> requestOsPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
    log('FCM: permission status — ${settings.authorizationStatus}');
    return settings.authorizationStatus;
  }

  /// Returns the current permission status without showing a dialog.
  Future<AuthorizationStatus> checkPermissionStatus() async {
    final settings = await _messaging.getNotificationSettings();
    return settings.authorizationStatus;
  }

  // ---------------------------------------------------------------------------
  // Local notifications setup
  // ---------------------------------------------------------------------------

  Future<void> _initLocalNotifications() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Permissions are requested via firebase_messaging; disable duplicates here
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _localNotifications.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
      onDidReceiveNotificationResponse: _onLocalNotificationTapped,
    );

    await _createAndroidChannel();
  }

  Future<void> _createAndroidChannel() async {
    const channel = AndroidNotificationChannel(
      channelId,
      channelName,
      description: _channelDescription,
      importance: Importance.high,
      playSound: true,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // ---------------------------------------------------------------------------
  // Message handlers
  // ---------------------------------------------------------------------------

  /// Shows a heads-up banner while the app is in the foreground.
  void _listenForeground() {
    FirebaseMessaging.onMessage.listen((message) async {
      log('FCM foreground: ${message.notification?.title}');
      final notification = message.notification;
      if (notification == null) return;

      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channelId,
            channelName,
            channelDescription: _channelDescription,
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data.toString(),
      );
    });
  }

  /// Handles tap when app is resumed from background via a notification.
  void _listenOpenedFromBackground() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log('FCM opened from background: ${message.messageId}');
      _handleNotificationPayload(message.data);
    });
  }

  /// Handles tap when app is launched from a terminated state.
  Future<void> _checkInitialMessage() async {
    final message = await _messaging.getInitialMessage();
    if (message != null) {
      log('FCM opened from terminated state: ${message.messageId}');
      _handleNotificationPayload(message.data);
    }
  }

  /// Called when the user taps a local (flutter_local_notifications) banner.
  void _onLocalNotificationTapped(NotificationResponse response) {
    log('Local notification tapped — payload: ${response.payload}');
    // TODO: parse payload and navigate accordingly
  }

  /// Central routing point for notification data payloads.
  /// Add navigation / deep-link logic here based on data['type'].
  void _handleNotificationPayload(Map<String, dynamic> data) {
    log('FCM payload: $data');
    // Example:
    // switch (data['type']) {
    //   case 'appointment': navigatorKey.currentState?.pushNamed(AppRoutes.schedule); break;
    //   case 'message':     navigatorKey.currentState?.pushNamed(AppRoutes.messages);  break;
    // }
  }

  // ---------------------------------------------------------------------------
  // Token management
  // ---------------------------------------------------------------------------

  Future<void> _initToken() async {
    _fcmToken = await _messaging.getToken();
    log('FCM token: $_fcmToken');
    if (_fcmToken != null) await sendTokenToBackend(_fcmToken!);

    // Keep backend in sync when the token rotates
    _messaging.onTokenRefresh.listen((token) {
      _fcmToken = token;
      log('FCM token refreshed: $token');
      sendTokenToBackend(token);
    });
  }
}
