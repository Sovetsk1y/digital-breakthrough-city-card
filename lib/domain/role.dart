enum Role { student, citizen, tourist }

extension RoleExt on Role {
  String get title {
    switch (this) {
      case Role.student:
        return 'Учащийся';
      case Role.citizen:
        return 'Горожанин';
      case Role.tourist:
        return 'Турист';
    }
  }
}
