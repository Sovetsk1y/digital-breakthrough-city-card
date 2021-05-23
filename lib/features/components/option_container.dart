import 'package:flutter/material.dart';

import 'bouncing_button.dart';

class OptionContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final isSelected;

  const OptionContainer({
    Key? key,
    required this.child,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.black.withOpacity(.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
