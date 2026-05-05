import 'user_role.dart';

class User {
  final String id;
  final String name;
  final String firstName;
  final String lastName;
  final String? username;
  final String email;
  final AccountType accountType;
  final bool isActive;
  final String? createdAt;
  final String? updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    this.username,
    required this.email,
    required this.accountType,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is User && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'User(id: $id, name: $name, accountType: ${accountType.name})';
}
