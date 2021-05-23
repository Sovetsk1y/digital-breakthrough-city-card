import 'dart:ui';

import 'package:city_card_novoros/domain/restaurants/restaurant.dart';
import 'package:city_card_novoros/features/components/app_text_field.dart';
import 'package:city_card_novoros/features/components/blur_overlay.dart';
import 'package:city_card_novoros/features/components/bottom_sheet_stick.dart';
import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/gradient_container.dart';
import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:city_card_novoros/features/restaurants/components/restaurant_reserved_dialog.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:city_card_novoros/utils/svg_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:city_card_novoros/domain/role.dart';
import 'package:flutter_svg/svg.dart';

class RestaurantBottomSheet extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantBottomSheet({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  _ParkingPresetBottomSheetState createState() =>
      _ParkingPresetBottomSheetState();
}

class _ParkingPresetBottomSheetState extends State<RestaurantBottomSheet> {
  int _page = 0;

  int _guests = 1;

  bool _showingDialog = false;

  @override
  Widget build(BuildContext context) {
    final role = RoleProvider.of(context)!.role;
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 8,
        sigmaY: 8,
      ),
      child: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BottomSheetStick(),
                          const SizedBox(height: 16),
                          Center(
                            child: Text(
                              widget.restaurant.name,
                              style: primaryTextBold28,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: Text(
                              widget.restaurant.description,
                              textAlign: TextAlign.center,
                              style: primaryTextRegular13.copyWith(
                                  color: AppColors.grey1),
                            ),
                          ),
                          const SizedBox(height: 16),
                          AspectRatio(
                            aspectRatio: 1.74,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: PageView(
                                onPageChanged: (page) {
                                  setState(() {
                                    _page = page;
                                  });
                                },
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1.74,
                                    child: Image.asset(
                                      widget.restaurant.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  AspectRatio(
                                    aspectRatio: 1.74,
                                    child: Image.asset(
                                      widget.restaurant.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  AspectRatio(
                                    aspectRatio: 1.74,
                                    child: Image.asset(
                                      widget.restaurant.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  AspectRatio(
                                    aspectRatio: 1.74,
                                    child: Image.asset(
                                      widget.restaurant.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                4,
                                (index) => Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: index == _page
                                            ? role.color
                                            : AppColors.grey2,
                                      ),
                                    )),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Бронирование стола',
                            style: primaryTextSemiBold22,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Укажите сколько вас человек',
                            style: primaryTextRegular13.copyWith(
                                color: AppColors.grey2),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              BouncingButton(
                                onTap: () {
                                  if (_guests == 1) return;
                                  setState(() {
                                    _guests--;
                                  });
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.black.withOpacity(.08),
                                  ),
                                  child: Center(
                                    child: Opacity(
                                      opacity: _guests == 1 ? 0.2 : 1,
                                      child: Text(
                                        '–',
                                        style: secondaryTextSemiBold17.copyWith(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.black.withOpacity(.08),
                                ),
                                child: Center(
                                  child: Text(
                                    _guests.toString(),
                                    style: secondaryTextSemiBold17.copyWith(
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              BouncingButton(
                                onTap: () {
                                  setState(() {
                                    _guests++;
                                  });
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.black.withOpacity(.08),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '+',
                                      style: secondaryTextSemiBold17.copyWith(
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Укажите дату',
                            style: primaryTextRegular13.copyWith(
                                color: AppColors.grey2),
                          ),
                          const SizedBox(height: 8),
                          IgnorePointer(
                            child: AppTextField(
                              controller: TextEditingController()
                                ..text = '06.06.2021',
                              suffix: Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: SvgPicture.asset(chevronDownSvgPath)),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Укажите время',
                            style: primaryTextRegular13.copyWith(
                                color: AppColors.grey2),
                          ),
                          const SizedBox(height: 8),
                          IgnorePointer(
                            child: AppTextField(
                              controller: TextEditingController()
                                ..text = '18:30',
                              suffix: Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: SvgPicture.asset(chevronDownSvgPath)),
                            ),
                          ),
                          const SizedBox(height: 24),
                          BouncingButton(
                            onTap: () {
                              setState(() {
                                _showingDialog = true;
                              });
                              showDialog(
                                context: context,
                                useRootNavigator: false,
                                barrierColor: Colors.black26,
                                builder: (context) =>
                                    RestaurantReservedDialog(),
                              ).then((value) {
                                setState(() {
                                  _showingDialog = false;
                                });
                              });
                            },
                            child: RoleGradientContainer(
                              borderRadius: BorderRadius.circular(14),
                              roleGradient: RoleGradientExt.fromRole(
                                  RoleProvider.of(context)!.role),
                              child: SizedBox(
                                height: 60,
                                child: Center(
                                  child: Text(
                                    'Забронировать стол',
                                    style: secondaryTextSemiBold17.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlurOverlay(show: _showingDialog)
        ],
      ),
    );
  }
}
