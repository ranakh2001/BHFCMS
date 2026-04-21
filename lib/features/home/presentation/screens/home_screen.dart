import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../widgets/daily_goals_section.dart';
import '../widgets/date_selector.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/upcoming_sessions_section.dart';
import '../widgets/welcome_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              SizedBox(height: res.scaleHeight(16)),
              
              const WelcomeHeader(userName: "رنا"), // Hardcoded for demo matching design
              SizedBox(height: res.scaleHeight(24)),
              
              const DateSelector(),
              SizedBox(height: res.scaleHeight(32)),
              
              const UpcomingSessionsSection(),
              SizedBox(height: res.scaleHeight(32)),
              
              const DailyGoalsSection(),
              SizedBox(height: res.scaleHeight(48)), // padding at the bottom above navbar
            ],
          ),
        ),
      ),
    );
  }
}
