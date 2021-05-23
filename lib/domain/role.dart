import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:flutter/material.dart';

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

  Color get color {
    switch (this) {
      case Role.student:
        return AppColors.studentGreen;
      case Role.citizen:
        return AppColors.citizenOrange;
      case Role.tourist:
        return AppColors.touristBlue;
    }
  }
}
