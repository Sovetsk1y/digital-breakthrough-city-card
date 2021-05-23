import 'package:city_card_novoros/domain/role.dart';
import 'package:city_card_novoros/features/home/home_body/home_body_model.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryContainer extends StatelessWidget {
  final CategoryData category;
  final Role role;

  const CategoryContainer({
    Key? key,
    required this.category,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black.withOpacity(0.04)),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(category.svgName),
                const SizedBox(height: 8),
                Text(
                  category.title,
                  style: secondaryTextRegular13.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          Visibility(
            visible: category.cashback != 0,
            child: Positioned(
              top: 12,
              right: 12,
              child: Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: role.color,
                ),
                child: Center(
                  child: Text(
                    '${category.cashback} %',
                    style: primaryTextSemiBold14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
