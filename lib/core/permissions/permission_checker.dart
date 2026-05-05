import '../../features/auth/domain/entities/user.dart';
import 'app_permission.dart';
import 'role_permissions.dart';

/// Usage: `user.can(AppPermission.viewChildren)`
extension UserPermissions on User {
  bool can(AppPermission permission) =>
      RolePermissions.permissionsFor(accountType).contains(permission);

  bool canAny(Iterable<AppPermission> permissions) =>
      permissions.any(can);

  bool canAll(Iterable<AppPermission> permissions) =>
      permissions.every(can);
}
