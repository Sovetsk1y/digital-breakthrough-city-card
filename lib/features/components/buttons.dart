import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/gradient_container.dart';
import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/material.dart';

class AppGradientButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  const AppGradientButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: onTap,
      child: RoleGradientContainer(
        borderRadius: BorderRadius.circular(14),
        roleGradient: RoleGradientExt.fromRole(RoleProvider.of(context)!.role),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: secondaryTextSemiBold17.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const AppButton({
    Key? key,
    this.backgroundColor,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.black,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(child: child),
      ),
    );
  }
}
