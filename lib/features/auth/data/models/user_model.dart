import '../../domain/entities/user.dart';
import '../../domain/entities/user_role.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.firstName,
    required super.lastName,
    super.username,
    required super.email,
    required super.accountType,
    super.isActive,
    super.createdAt,
    super.updatedAt,
  });

  /// Handles two shapes:
  ///   1. Raw API `data` object (snake_case keys: first_name, last_name, is_active, …)
  ///   2. Locally persisted snapshot written by [toJson] (camelCase keys)
  ///
  /// Pass [accountType] when the value lives outside the object (root-level in
  /// the API response). Falls back to `json['role']` for cached snapshots.
  factory UserModel.fromJson(
    Map<String, dynamic> json, {
    String? accountType,
  }) {
    final firstName = (json['first_name'] as String?) ??
        (json['firstName'] as String?) ??
        '';
    final lastName = (json['last_name'] as String?) ??
        (json['lastName'] as String?) ??
        '';
    final name = (json['name'] as String?) ??
        '$firstName $lastName'.trim();

    final rawAccountType = accountType ??
        json['account_type'] as String? ??
        json['role'] as String? ??
        'therapist';

    final rawIsActive = json['is_active'] ?? json['isActive'];
    final bool isActive;
    if (rawIsActive is int) {
      isActive = rawIsActive == 1;
    } else if (rawIsActive is bool) {
      isActive = rawIsActive;
    } else {
      isActive = true;
    }

    return UserModel(
      id: json['id'].toString(),
      name: name,
      firstName: firstName,
      lastName: lastName,
      username: json['username'] as String?,
      email: json['email'] as String,
      accountType: AccountType.fromString(rawAccountType),
      isActive: isActive,
      createdAt: (json['created_at'] as String?) ?? (json['createdAt'] as String?),
      updatedAt: (json['updated_at'] as String?) ?? (json['updatedAt'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'role': accountType.name,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() =>
      'UserModel(id: $id, name: $name, accountType: ${accountType.name})';
}
