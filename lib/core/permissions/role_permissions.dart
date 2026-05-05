import '../../features/auth/domain/entities/user_role.dart';
import 'app_permission.dart';

/// Single source of truth: which permissions each account type holds.
/// To grant/revoke a capability for a role, change it here only.
class RolePermissions {
  RolePermissions._();

  static const Map<AccountType, Set<AppPermission>> _map = {
    AccountType.therapist: {
      AppPermission.viewChildren,
      AppPermission.manageChildren,
      AppPermission.viewAiSuggestions,
      AppPermission.viewSchedule,
      AppPermission.manageSchedule,
      AppPermission.sendMessages,
      AppPermission.viewReports,
    },
    AccountType.parent: {
      AppPermission.viewChildren,
      AppPermission.viewSchedule,
      AppPermission.sendMessages,
      AppPermission.viewReports,
    },
    AccountType.receptionist: {
      AppPermission.viewChildren,
      AppPermission.viewSchedule,
      AppPermission.manageSchedule,
      AppPermission.manageAppointments,
      AppPermission.manageRegistrations,
    },
    AccountType.supervisor: {
      AppPermission.viewChildren,
      AppPermission.manageChildren,
      AppPermission.viewAiSuggestions,
      AppPermission.viewSchedule,
      AppPermission.sendMessages,
      AppPermission.viewReports,
      // No manageSchedule, manageAppointments, manageRegistrations
      // Supervisor can view but not edit appointments
    },
  };

  static Set<AppPermission> permissionsFor(AccountType accountType) =>
      _map[accountType] ?? const {};
}
