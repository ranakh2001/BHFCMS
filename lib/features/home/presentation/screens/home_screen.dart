import 'package:bhcfms_app/features/auth/domain/entities/user_role.dart';
import 'package:bhcfms_app/features/home/presentation/widgets/child_card.dart';
import 'package:bhcfms_app/features/home/presentation/widgets/child_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/permissions/user_role_policy.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../widgets/daily_goals_section.dart';
import '../widgets/date_selector.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/receptionist_dashboard.dart';
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
    final policy = ref.watch(currentPolicyProvider);

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              SizedBox(height: res.scaleHeight(16)),
              WelcomeHeader(userName: userName),
              SizedBox(height: res.scaleHeight(24)),
              
              // ── Receptionist Dashboard ──────────────────────────────
              if (user?.role == UserRole.receptionist)
                const ReceptionistDashboard(),

              // ── Role Specific Content ──────────────────────────────
              if (user?.role == UserRole.therapist) const DateSelector(),
              if (user?.role == UserRole.parent) const ChildCard(),
              
              if (user?.role != UserRole.receptionist)
                SizedBox(height: res.scaleHeight(32)),
                
              if (user?.role == UserRole.parent) const ChildProgress(),
              if (user?.role == UserRole.therapist)
                const UpcomingSessionsSection(),
              
              if (user?.role == UserRole.parent)
                SizedBox(height: res.scaleHeight(32)),
              
              if (user?.role != UserRole.receptionist)
                DailyGoalsSection(canEdit: policy?.canManageSessions ?? false),
              
              if (user?.role != UserRole.receptionist)
                SizedBox(height: res.scaleHeight(48)),
            ],
          ),
        ),
      ),
    );
  }
}
