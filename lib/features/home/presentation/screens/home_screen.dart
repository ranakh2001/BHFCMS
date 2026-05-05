import 'package:bhcfms_app/features/auth/domain/entities/user_role.dart';
import 'package:bhcfms_app/features/home/presentation/widgets/child_card.dart';
import 'package:bhcfms_app/features/home/presentation/widgets/child_progress.dart';
import 'package:bhcfms_app/features/home/presentation/widgets/supervisor_dashboard.dart';
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

              // ── Supervisor Dashboard ────────────────────────────────
              if (user?.accountType == AccountType.supervisor)
                const SupervisorDashboard(),

              // ── Receptionist Dashboard ──────────────────────────────
              if (user?.accountType == AccountType.receptionist)
                const ReceptionistDashboard(),

              // ── Role Specific Content ──────────────────────────────
              if (user?.accountType == AccountType.therapist) const DateSelector(),
              if (user?.accountType == AccountType.parent) const ChildCard(),

              if (user?.accountType != AccountType.receptionist &&
                  user?.accountType != AccountType.supervisor)
                SizedBox(height: res.scaleHeight(32)),

              if (user?.accountType == AccountType.parent) const ChildProgress(),
              if (user?.accountType == AccountType.therapist)
                const UpcomingSessionsSection(),

              if (user?.accountType == AccountType.parent)
                SizedBox(height: res.scaleHeight(32)),

              if (user?.accountType != AccountType.receptionist &&
                  user?.accountType != AccountType.supervisor)
                DailyGoalsSection(canEdit: policy?.canManageSessions ?? false),

              if (user?.accountType != AccountType.receptionist &&
                  user?.accountType != AccountType.supervisor)
                SizedBox(height: res.scaleHeight(48)),
            ],
          ),
        ),
      ),
    );
  }
}
