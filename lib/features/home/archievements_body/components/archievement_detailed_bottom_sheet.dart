import 'dart:ui';

import 'package:city_card_novoros/domain/archievements/archievement.dart';
import 'package:city_card_novoros/features/components/bottom_sheet_stick.dart';
import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:city_card_novoros/utils/svg_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:city_card_novoros/domain/role.dart';

class ArchievementDetailedBottomSheet extends StatefulWidget {
  final Archievement archievement;
  ArchievementDetailedBottomSheet({
    Key? key,
    required this.archievement,
  }) : super(key: key);

  @override
  _ParkingPresetBottomSheetState createState() =>
      _ParkingPresetBottomSheetState();
}

class _ParkingPresetBottomSheetState
    extends State<ArchievementDetailedBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final role = RoleProvider.of(context)!.role;
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 8,
        sigmaY: 8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BottomSheetStick(),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 26),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.04),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          widget.archievement.svgName,
                          color: role.color,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.archievement.name,
                          style: primaryTextBold28,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  widget.archievement.description,
                  textAlign: TextAlign.center,
                  style: secondaryTextRegular17.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                if (widget.archievement.isArchieved)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 32,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: role.color,
                            ),
                            child: Center(
                                child: SvgPicture.asset(archievedSvgPath)),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Выполнено',
                            style: secondaryTextRegular17.copyWith(
                                color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
