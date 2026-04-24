enum UserRole {
  therapist,
  parent,
  receptionist;

  String get displayName {
    switch (this) {
      case UserRole.therapist:
        return 'Therapist';
      case UserRole.parent:
        return 'Parent';
      case UserRole.receptionist:
        return 'Receptionist';
    }
  }

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (r) => r.name == value,
      orElse: () => UserRole.therapist,
    );
  }
}
