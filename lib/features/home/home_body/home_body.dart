import 'package:city_card_novoros/domain/role.dart';
import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/buttons.dart';
import 'package:city_card_novoros/features/components/gradient_container.dart';
import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:city_card_novoros/features/feedback/feedback_page.dart';
import 'package:city_card_novoros/features/home/home_body/components/category_container.dart';
import 'package:city_card_novoros/features/home/home_body/home_body_model.dart';
import 'package:city_card_novoros/features/parking/parking_map_page.dart';
import 'package:city_card_novoros/features/reservations/components/my_reservations_bottom_sheet.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'components/role_card.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  void _navigateToCategory(int index) {
    switch (index) {
      case 0:
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
        break;
      case 1:
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ParkingMapPage()));
        break;
      case 3:
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final role = RoleProvider.of(context)!.role;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1.734,
                child: RoleCard(
                  role: RoleProvider.of(context)!.role,
                ),
              ),
              Expanded(
                flex: 0,
                child: _buildPageIndicator(),
              ),
              _buildFeedbackButton(role),
              Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16).add(
                        EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.3),
                      ),
                      itemCount: categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1.33,
                      ),
                      itemBuilder: (context, index) {
                        return BouncingButton(
                            onTap: () => _navigateToCategory(index),
                            child: CategoryContainer(
                              role: role,
                              category: categories[index],
                            ));
                      })),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildReservationButton(),
          )
        ],
      ),
    );
  }

  Container _buildReservationButton() {
    final role = RoleProvider.of(context)!.role;
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: [0.8, 1],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.1),
              ])),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppButton(
                onTap: () {
                  showMaterialModalBottomSheet(
                      animationCurve: Curves.easeInOut,
                      context: context,
                      backgroundColor: Colors.transparent,
                      expand: true,
                      builder: (context) => RoleProvider(
                          role: role, child: MyReservationsBottomSheet()));
                },
                child: Text(
                  'Мои покупки / бронирования',
                  style: primaryTextSemiBold17.copyWith(color: Colors.white),
                )),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Padding _buildFeedbackButton(Role role) {
    final role = RoleProvider.of(context)!.role;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BouncingButton(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                RoleProvider(role: role, child: FeedbackPage()))),
        child: RoleGradientContainer(
          borderRadius: BorderRadius.circular(14),
          roleGradient: RoleGradientExt.fromRole(role),
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.exclamationmark_triangle_fill,
                  size: 22,
                  color: Colors.black,
                ),
                const SizedBox(width: 4),
                Text(
                  'Сообщить о проблеме в городе',
                  style: primaryTextSemiBold17.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    final role = RoleProvider.of(context)!.role;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoleGradientContainer(
          borderRadius: BorderRadius.circular(10),
          roleGradient: RoleGradientExt.fromRole(role),
          child: Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.grey2,
          ),
        ),
      ],
    );
  }
}
