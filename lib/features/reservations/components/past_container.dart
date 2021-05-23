import 'package:city_card_novoros/domain/role.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PastContainer extends StatelessWidget {
  final Role role;
  final String svgPath;
  final String title;
  final String subtitle;
  final String priceText;
  PastContainer({
    Key? key,
    required this.role,
    required this.svgPath,
    required this.title,
    required this.subtitle,
    required this.priceText,
  }) : super(key: key);

  final color = AppColors.grey2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black.withOpacity(.04),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: SvgPicture.asset(
              svgPath,
              color: color,
              width: 32,
              height: 32,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: primaryTextBold18.copyWith(color: color),
                  ),
                  Text(
                    subtitle,
                    style: secondaryTextRegular13.copyWith(
                      color: color,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text(
                  priceText,
                  style: secondaryTextSemiBold17.copyWith(color: color),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(width: 4),
                Icon(
                  CupertinoIcons.money_rubl_circle_fill,
                  color: color,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
