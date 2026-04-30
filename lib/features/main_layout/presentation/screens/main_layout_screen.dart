import 'package:bhcfms_app/features/auth/domain/entities/user_role.dart';
import 'package:bhcfms_app/features/children/presentation/screens/child_details_screen.dart';
import 'package:bhcfms_app/features/supervisor/presentation/screens/supervisor_center_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/routes.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../children/presentation/screens/children_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../messages/presentation/screens/messages_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../schedule/presentation/screens/schedule_screen.dart';
import '../../domain/nav_destination.dart';
import '../widgets/custom_bottom_nav_bar.dart';

/// Shared shell for ALL roles.
///
/// Every authenticated user lands here regardless of role.  The tab list and
/// the screens themselves are identical for everyone — role-specific UI lives
/// INSIDE each screen, not here.
///
/// ─── How to add role-based content inside any screen ────────────────────────
///
///   // 1. Make the screen a ConsumerWidget (or ConsumerStatefulWidget).
///   // 2. Read the current user:
///   //       final user = ref.watch(currentUserProvider);
///   //
///   // 3. Gate content with role:
///   //       if (user?.role == UserRole.therapist) { ... }
///   //
///   // 4. Or gate with a permission (preferred — keeps role logic centralised):
///   //       if (user?.can(AppPermission.manageChildren) == true) { ... }
///   //
///   // The permission map lives in core/permissions/role_permissions.dart.
///   // Add new permissions there; screens never need to change.
/// ────────────────────────────────────────────────────────────────────────────
class MainLayoutScreen extends ConsumerStatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  ConsumerState<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends ConsumerState<MainLayoutScreen> {
  int _currentIndex = 0;

  // Fixed destinations — same order and screens for every role.
  // To show/hide a tab per role later, add an `if (user.can(...))` guard
  // here and rebuild the list inside `build()` instead of keeping it static.

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    // Safety guard — redirect to login if the session was cleared mid-session
    // (e.g. token expired, forced logout from another device).
    if (!authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      });
      return const SizedBox.shrink();
    }
    final user = ref.watch(currentUserProvider);
    final isSupervisor = user?.role == UserRole.supervisor;
    final destinations = [
      const NavDestination(iconPath: AppIcons.home, screen: HomeScreen()),
      NavDestination(
        iconPath: isSupervisor ? AppIcons.center : AppIcons.children,
        screen: isSupervisor
            ? const SupervisorCenterScreen()
            : (user?.role == UserRole.parent
                ? const ChildDetailsScreen()
                : const ChildrenScreen()),
      ),
      const NavDestination(
        iconPath: AppIcons.schedule,
        screen: ScheduleScreen(),
      ),
      const NavDestination(iconPath: AppIcons.chat, screen: MessagesScreen()),
      const NavDestination(iconPath: AppIcons.profile, screen: ProfileScreen()),
    ];
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: destinations.map((d) => d.screen).toList(),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        iconPaths: destinations.map((d) => d.iconPath).toList(),
        onTap: (index) {
          if (_currentIndex != index) {
            setState(() => _currentIndex = index);
          }
        },
      ),
    );
  }
}
