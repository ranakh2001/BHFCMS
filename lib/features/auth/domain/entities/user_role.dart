enum AccountType {
  therapist,
  parent,
  receptionist,
  supervisor;

  String get displayName {
    switch (this) {
      case AccountType.therapist:
        return 'Therapist';
      case AccountType.parent:
        return 'Parent';
      case AccountType.receptionist:
        return 'Receptionist';
      case AccountType.supervisor:
        return 'Supervisor';
    }
  }

  static AccountType fromString(String value) {
    // Map API alias "reception" to the internal "receptionist" value.
    final normalised = value == 'reception' ? 'receptionist' : value;
    return AccountType.values.firstWhere(
      (r) => r.name == normalised,
      orElse: () => AccountType.therapist,
    );
  }
}
