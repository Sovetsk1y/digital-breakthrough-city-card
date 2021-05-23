import 'dart:ui';

import 'package:city_card_novoros/features/components/bottom_sheet_stick.dart';
import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/buttons.dart';
import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:city_card_novoros/features/reservations/components/actual_container.dart';
import 'package:city_card_novoros/features/reservations/components/past_container.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:city_card_novoros/utils/svg_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyReservationsBottomSheet extends StatefulWidget {
  MyReservationsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  _ParkingPresetBottomSheetState createState() =>
      _ParkingPresetBottomSheetState();
}

class _ParkingPresetBottomSheetState extends State<MyReservationsBottomSheet> {
  String _carNumber = '';

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
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BottomSheetStick(),
                const SizedBox(height: 24),
                Text(
                  'Актуальные',
                  style:
                      secondaryTextSemiBold17.copyWith(color: AppColors.grey2),
                ),
                const SizedBox(height: 16),
                ActualContainer(
                  role: role,
                  svgPath: cafeSvgPath,
                  title: 'Бронирование стола',
                  subtitle: 'Ресторан Эник Беник',
                  dateTimeText: 'Сегодня в 18:00',
                ),
                const SizedBox(height: 8),
                ActualContainer(
                  role: role,
                  svgPath: sportSvgPath,
                  title: 'Абонемент',
                  subtitle: 'Спортзал “Веселка”',
                ),
                const SizedBox(height: 26),
                Text(
                  'Прошедшие',
                  style:
                      secondaryTextSemiBold17.copyWith(color: AppColors.grey2),
                ),
                const SizedBox(height: 18),
                PastContainer(
                  role: role,
                  svgPath: sportSvgPath,
                  title: 'Абонемент',
                  subtitle: 'Спортзал “Веселка”',
                  priceText: '50,43',
                ),
                const SizedBox(height: 8),
                PastContainer(
                  role: role,
                  svgPath: sportSvgPath,
                  title: 'Абонемент',
                  subtitle: 'Спортзал “Веселка”',
                  priceText: '50,43',
                ),
                const SizedBox(height: 8),
                PastContainer(
                  role: role,
                  svgPath: sportSvgPath,
                  title: 'Абонемент',
                  subtitle: 'Спортзал “Веселка”',
                  priceText: '50,43',
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
