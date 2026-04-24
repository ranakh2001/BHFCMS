import '../../features/auth/domain/entities/user_role.dart';
import 'app_permission.dart';

/// Single source of truth: which permissions each role holds.
/// To grant/revoke a capability for a role, change it here only.
class RolePermissions {
  RolePermissions._();

  static const Map<UserRole, Set<AppPermission>> _map = {
    UserRole.therapist: {
      AppPermission.viewChildren,
      AppPermission.manageChildren,
      AppPermission.viewAiSuggestions,
      AppPermission.viewSchedule,
      AppPermission.manageSchedule,
      AppPermission.sendMessages,
      AppPermission.viewReports,
    },
    UserRole.parent: {
      AppPermission.viewChildren,
      AppPermission.viewSchedule,
      AppPermission.sendMessages,
      AppPermission.viewReports,
    },
    UserRole.receptionist: {
      AppPermission.viewChildren,
      AppPermission.viewSchedule,
      AppPermission.manageSchedule,
      AppPermission.manageAppointments,
      AppPermission.manageRegistrations,
    },
  };

  static Set<AppPermission> permissionsFor(UserRole role) =>
      _map[role] ?? const {};
}
