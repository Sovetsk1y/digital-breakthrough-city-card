import 'package:city_card_novoros/features/components/buttons.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantReservedDialog extends StatelessWidget {
  const RestaurantReservedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Успех!',
                  textAlign: TextAlign.center,
                  style: primaryTextBold34,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Стол забронирован',
                textAlign: TextAlign.center,
                style: secondaryTextRegular17.copyWith(color: AppColors.grey1),
              ),
              const SizedBox(height: 32),
              AppButton(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text(
                    'Закрыть',
                    style:
                        secondaryTextSemiBold17.copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
