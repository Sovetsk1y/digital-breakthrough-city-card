import 'dart:ui';

import 'package:city_card_novoros/features/components/bottom_sheet_stick.dart';
import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/buttons.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParkingPresetBottomSheet extends StatefulWidget {
  final VoidCallback? onParkingStarted;
  ParkingPresetBottomSheet({
    Key? key,
    this.onParkingStarted,
  }) : super(key: key);

  @override
  _ParkingPresetBottomSheetState createState() =>
      _ParkingPresetBottomSheetState();
}

class _ParkingPresetBottomSheetState extends State<ParkingPresetBottomSheet> {
  String _carNumber = '';

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 8,
        sigmaY: 8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.all(18),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BottomSheetStick(),
                const SizedBox(height: 16),
                Text('Введите регистрационный  номер автомобиля',
                    style: secondaryTextSemiBold17.copyWith(
                      color: AppColors.grey1,
                    )),
                const SizedBox(height: 8),
                CupertinoTextField(
                  maxLength: 8,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  placeholder: 'X000XX69',
                  style: secondaryTextSemiBold17.copyWith(color: Colors.black),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.black.withOpacity(.08),
                  ),
                  textCapitalization: TextCapitalization.characters,
                  placeholderStyle:
                      secondaryTextSemiBold17.copyWith(color: Colors.black26),
                  onChanged: (text) {
                    setState(() {
                      _carNumber = text;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text('Выберете способ оплаты',
                    style: secondaryTextSemiBold17.copyWith(
                      color: AppColors.grey1,
                    )),
                const SizedBox(height: 16),
                PayOptionContainer(
                    child: Center(
                  child: Text(
                    'Городская карта',
                    style:
                        secondaryTextSemiBold17.copyWith(color: Colors.black),
                  ),
                )),
                const SizedBox(height: 8),
                PayOptionContainer(
                    child: Center(
                  child: Text(
                    'Бонусы',
                    style:
                        secondaryTextSemiBold17.copyWith(color: Colors.black),
                  ),
                )),
                const SizedBox(height: 8),
                PayOptionContainer(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/apple.png'),
                    const SizedBox(width: 8),
                    Text(
                      'Pay',
                      style:
                          secondaryTextSemiBold17.copyWith(color: Colors.black),
                    ),
                  ],
                )),
                const SizedBox(height: 8),
                PayOptionContainer(
                    onTap: () {
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/google.png'),
                        const SizedBox(width: 8),
                        Text(
                          'Pay',
                          style: secondaryTextSemiBold17.copyWith(
                              color: Colors.black),
                        ),
                      ],
                    )),
                const SizedBox(height: 16),
                IgnorePointer(
                  ignoring: _carNumber.length != 8,
                  child: Opacity(
                    opacity: _carNumber.length != 8 ? .2 : 1,
                    child: AppButton(
                        onTap: () {
                          widget.onParkingStarted?.call();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Дальше',
                          style: secondaryTextSemiBold17.copyWith(
                              color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PayOptionContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const PayOptionContainer({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
