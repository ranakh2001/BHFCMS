import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../widgets/daily_goals_section.dart';
import '../widgets/date_selector.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/upcoming_sessions_section.dart';
import '../widgets/welcome_header.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ResponsiveHelper(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Real user name from the authenticated session.
    // Use user?.role or user?.can(AppPermission.x) here to add
    // role-based sections without duplicating this screen.
    final user = ref.watch(currentUserProvider);
    final userName = user?.name ?? '';

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              SizedBox(height: res.scaleHeight(16)),
              WelcomeHeader(userName: userName),
              SizedBox(height: res.scaleHeight(24)),
              const DateSelector(),
              SizedBox(height: res.scaleHeight(32)),
              const UpcomingSessionsSection(),
              SizedBox(height: res.scaleHeight(32)),
              const DailyGoalsSection(),
              SizedBox(height: res.scaleHeight(48)),
            ],
          ),
        ),
      ),
    );
  }
}
