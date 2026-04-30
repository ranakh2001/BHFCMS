enum UserRole {
  therapist,
  parent,
  receptionist,
  supervisor;

  String get displayName {
    switch (this) {
      case UserRole.therapist:
        return 'Therapist';
      case UserRole.parent:
        return 'Parent';
      case UserRole.receptionist:
        return 'Receptionist';
      case UserRole.supervisor:
        return 'Supervisor';
    }
  }

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (r) => r.name == value,
      orElse: () => UserRole.therapist,
    );
  }
}
