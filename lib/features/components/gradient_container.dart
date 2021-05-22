import 'package:city_card_novoros/domain/role.dart';
import 'package:city_card_novoros/features/components/gradients.dart';
import 'package:flutter/material.dart';

enum RoleGradient { tourist, citizen, student }

extension RoleGradientExt on RoleGradient {
  static RoleGradient fromRole(Role role) {
    switch (role) {
      case Role.citizen:
        return RoleGradient.citizen;
      case Role.tourist:
        return RoleGradient.tourist;
      case Role.student:
        return RoleGradient.student;
    }
  }

  Gradient get gradient {
    switch (this) {
      case RoleGradient.citizen:
        return citizenGradient;
      case RoleGradient.tourist:
        return touristGradient;
      case RoleGradient.student:
        return studentGradient;
    }
  }
}

class RoleGradientContainer extends StatelessWidget {
  final RoleGradient roleGradient;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Widget child;

  const RoleGradientContainer({
    Key? key,
    required this.roleGradient,
    required this.child,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: roleGradient.gradient,
        boxShadow: [
          // asdf
        ],
      ),
      child: child,
    );
  }
}
