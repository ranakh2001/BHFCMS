import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../firebase_options.dart';

/// Top-level background message handler.
/// Must be a top-level function — cannot be a class method or closure.
/// Flutter runs this in a separate isolate when the app is killed/backgrounded.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  log(
    'FCM background message received: [${message.messageId}] '
    '${message.notification?.title ?? "(no title)"}',
  );
}
