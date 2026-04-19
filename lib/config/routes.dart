import 'package:flutter/material.dart';
import '../features/auth/presentation/screens/login_screen.dart';

class AppRoutes {
  static const String initial = '/'; // Can be splash or check auth
  static const String login = '/login';
  static const String home = '/home'; // e.g. layout screen for dashboard

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginScreen(),
      // Add other feature top-level routes here
    };
  }
}
