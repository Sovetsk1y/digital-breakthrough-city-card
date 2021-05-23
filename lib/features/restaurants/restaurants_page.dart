import 'package:city_card_novoros/features/components/back_button.dart';
import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:city_card_novoros/features/restaurants/components/restaurant_container.dart';
import 'package:city_card_novoros/features/restaurants/restaurants_page_model.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:city_card_novoros/utils/svg_paths.dart';
import 'package:flutter/material.dart';
import 'package:city_card_novoros/domain/role.dart';
import 'package:flutter_svg/svg.dart';

class RestaurantsPage extends StatefulWidget {
  RestaurantsPage({Key? key}) : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  @override
  Widget build(BuildContext context) {
    final role = RoleProvider.of(context)!.role;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: AppBackButton(
                backgroundColor: AppColors.grey2,
              ),
            ),
          ],
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              cafeSvgPath,
              color: role.color,
              width: 28,
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(
              'Рестораны, кафе',
              style: primaryTextSemiBold22,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: RestaurantContainer(
                  restaurant: restaurants[index],
                  role: role,
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      stops: [0.3, 1],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.white.withOpacity(0.7),
                        Colors.white.withOpacity(0.1),
                      ])),
            ),
          )
        ],
      ),
    );
  }
}
