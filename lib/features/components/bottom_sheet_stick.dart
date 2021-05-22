import 'package:flutter/material.dart';

class BottomSheetStick extends StatelessWidget {
  const BottomSheetStick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 5,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.3),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
