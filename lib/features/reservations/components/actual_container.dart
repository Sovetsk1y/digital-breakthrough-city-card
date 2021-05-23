import 'package:city_card_novoros/domain/role.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActualContainer extends StatelessWidget {
  final Role role;
  final String svgPath;
  final String title;
  final String subtitle;
  final String? dateTimeText;
  const ActualContainer({
    Key? key,
    required this.role,
    required this.svgPath,
    required this.title,
    required this.subtitle,
    this.dateTimeText,
  }) : super(key: key);

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
              color: role.color,
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
                    style: primaryTextBold18,
                  ),
                  Text(
                    subtitle,
                    style: secondaryTextRegular13.copyWith(
                      color: AppColors.grey2,
                    ),
                  )
                ],
              ),
            ),
          ),
          if (dateTimeText != null)
            Expanded(
              flex: 1,
              child: Text(
                dateTimeText!,
                style: primaryTextRegular13,
                textAlign: TextAlign.end,
              ),
            )
        ],
      ),
    );
  }
}
