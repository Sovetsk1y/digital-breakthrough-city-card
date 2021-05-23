import 'package:city_card_novoros/domain/restaurants/restaurant.dart';
import 'package:city_card_novoros/domain/role.dart';
import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:city_card_novoros/features/reservations/components/my_reservations_bottom_sheet.dart';
import 'package:city_card_novoros/features/restaurants/restaurant_bottom_sheet.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RestaurantContainer extends StatelessWidget {
  final Restaurant restaurant;
  final Role role;

  const RestaurantContainer({
    Key? key,
    required this.restaurant,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: () {
        showMaterialModalBottomSheet(
            animationCurve: Curves.easeInOut,
            context: context,
            backgroundColor: Colors.transparent,
            expand: true,
            builder: (context) => RoleProvider(
                role: role,
                child: RestaurantBottomSheet(
                  restaurant: restaurant,
                )));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.04),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 1.55,
                  child: Image.asset(
                    restaurant.image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  restaurant.name,
                  style: secondaryTextSemiBold17.copyWith(
                    color: Colors.black,
                  ),
                ),
                Text(
                  restaurant.description,
                  style: primaryTextRegular13.copyWith(
                    color: AppColors.grey1,
                  ),
                )
              ],
            ),
            Visibility(
              visible: restaurant.cashback != 0,
              child: Positioned(
                top: -6,
                left: -6,
                child: Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: role.color,
                  ),
                  child: Center(
                    child: Text(
                      '${restaurant.cashback} %',
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
      ),
    );
  }
}
