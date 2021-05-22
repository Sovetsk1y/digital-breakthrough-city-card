import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _sideSize = 44;
const double _borderRadius = 12;

class AppBackButton extends StatelessWidget {
  final Color? backgroundColor;

  const AppBackButton({
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      scale: BounceScale.iconButton(),
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        height: _sideSize,
        width: _sideSize,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.black,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Center(
            child: Icon(
          CupertinoIcons.arrow_left,
          size: 22,
          color: Colors.white,
        )),
      ),
    );
  }
}
