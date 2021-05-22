import 'package:flutter/material.dart';

class ArchievementsBody extends StatefulWidget {
  ArchievementsBody({Key? key}) : super(key: key);

  @override
  _ArchievementsBodyState createState() => _ArchievementsBodyState();
}

class _ArchievementsBodyState extends State<ArchievementsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }
}
