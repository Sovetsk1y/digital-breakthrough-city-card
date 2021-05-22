import 'package:city_card_novoros/domain/role.dart';
import 'package:flutter/material.dart';

class RoleProvider extends InheritedWidget {
  final Role role;

  RoleProvider({
    Key? key,
    required this.child,
    required this.role,
  }) : super(key: key, child: child);

  final Widget child;

  static RoleProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RoleProvider>();
  }

  @override
  bool updateShouldNotify(RoleProvider oldWidget) {
    return true;
  }
}
