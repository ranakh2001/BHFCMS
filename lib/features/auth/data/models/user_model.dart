import '../../domain/entities/user.dart';
import '../../domain/entities/user_role.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
  });

  /// Parses either the raw API `data` object (with first_name/last_name)
  /// or a locally persisted snapshot (with pre-joined `name`).
  /// Pass [accountType] when parsing the raw API response.
  factory UserModel.fromJson(Map<String, dynamic> json, {String? accountType}) {
    final String name;
    if (json.containsKey('first_name')) {
      final first = json['first_name'] as String? ?? '';
      final last = json['last_name'] as String? ?? '';
      name = '$first $last'.trim();
    } else {
      name = json['name'] as String? ?? '';
    }

    return UserModel(
      id: json['id'].toString(),
      name: name,
      email: json['email'] as String,
      role: UserRole.fromString(
        (accountType ?? json['role'] as String?) ?? 'therapist',
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role.name,
    };
  }

  @override
  String toString() => 'UserModel(id: $id, name: $name, role: ${role.name})';
}
