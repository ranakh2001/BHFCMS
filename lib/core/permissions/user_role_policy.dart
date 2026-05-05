import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/domain/entities/user.dart';
import '../../features/auth/domain/entities/user_role.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import 'app_permission.dart';
import 'permission_checker.dart';

/// Presentation-layer gate: single source of truth for all role-based UI decisions.
/// Screens read [currentPolicyProvider] and call boolean getters
/// instead of scattering raw role checks across widgets.
class UserRolePolicy {
  final User user;

  const UserRolePolicy(this.user);

  // ─── Children ────────────────────────────────────────────────────────────
  bool get canManageChildren => user.can(AppPermission.manageChildren);
  bool get canViewAiSuggestions => user.can(AppPermission.viewAiSuggestions);

  // ─── Schedule ────────────────────────────────────────────────────────────
  bool get canManageSchedule => user.can(AppPermission.manageSchedule);

  // ─── Sessions ────────────────────────────────────────────────────────────
  /// Start/end sessions, upload media, run assessments — therapist-only.
  bool get canManageSessions =>
      canManageChildren && user.accountType == AccountType.therapist;

  // ─── Reports ─────────────────────────────────────────────────────────────
  bool get canViewReports => user.can(AppPermission.viewReports);

  // ─── Messaging ───────────────────────────────────────────────────────────
  bool get canSendMessages => user.can(AppPermission.sendMessages);

  // ─── Supervisor ──────────────────────────────────────────────────────────
  bool get isSupervisor => user.accountType == AccountType.supervisor;
  bool get canViewEmployees => user.accountType == AccountType.supervisor;
  bool get canEditCaseStudy => user.can(AppPermission.manageChildren);

  // ─── Media ───────────────────────────────────────────────────────────────
  bool get canUploadMedia => isSupervisor || canManageSessions;
  bool get canShareWithParent => isSupervisor;

  // ─── Family ──────────────────────────────────────────────────────────────
  bool get isFamily => user.accountType == AccountType.parent;

  // ─── Reception ───────────────────────────────────────────────────────────
  bool get isReceptionist => user.accountType == AccountType.receptionist;
}

/// Non-null only when a user is authenticated.
final currentPolicyProvider = Provider<UserRolePolicy?>((ref) {
  final user = ref.watch(currentUserProvider);
  return user != null ? UserRolePolicy(user) : null;
});
