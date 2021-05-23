import 'package:city_card_novoros/domain/archievements/archievement.dart';
import 'package:city_card_novoros/domain/role.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:city_card_novoros/utils/svg_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArchievementContainer extends StatelessWidget {
  final Archievement archievement;
  final Role role;

  const ArchievementContainer({
    Key? key,
    required this.archievement,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black.withOpacity(0.04)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(archievement.svgName),
                const SizedBox(height: 8),
                Text(
                  archievement.name,
                  style: secondaryTextRegular13.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          Visibility(
            visible: archievement.isArchieved,
            child: Positioned(
              top: -12,
              right: -12,
              child: Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: role.color,
                ),
                child: Center(child: SvgPicture.asset(archievedSvgPath)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
