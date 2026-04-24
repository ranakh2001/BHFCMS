import 'package:flutter/material.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/case_study_form/presentation/screens/case_study_form_screen.dart';
import '../features/case_study_form/presentation/screens/case_study_intro_screen.dart';
import '../features/children/presentation/screens/child_details_screen.dart';
import '../features/children/presentation/screens/assessment_screen.dart';
import '../features/children/presentation/screens/ai_suggestions_screen.dart';
import '../features/main_layout/presentation/screens/main_layout_screen.dart';
import '../features/notifications/presentation/screens/notifications_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String main = '/main';
  static const String notifications = '/notifications';
  static const String childDetails = '/child-details';
  static const String assessment = '/assessment';
  static const String aiSuggestions = '/ai-suggestions';
  static const String caseStudyIntro = '/case-study-intro';
  static const String caseStudyForm = '/case-study-form';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      initial: (context) => const SplashScreen(),
      login: (context) => const LoginScreen(),
      main: (context) => const MainLayoutScreen(),
      notifications: (context) => const NotificationsScreen(),
      childDetails: (context) => const ChildDetailsScreen(),
      assessment: (context) => const AssessmentScreen(),
      aiSuggestions: (context) => const AiSuggestionsScreen(),
      caseStudyIntro: (context) => const CaseStudyIntroScreen(),
      caseStudyForm: (context) => const CaseStudyFormScreen(),
    };
  }
}
