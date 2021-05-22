import 'package:city_card_novoros/features/components/buttons.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/material.dart';

class FeedbackSuccessDialog extends StatelessWidget {
  const FeedbackSuccessDialog({Key? key}) : super(key: key);

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
              Text(
                'Успех!',
                style: primaryTextBold34,
              ),
              const SizedBox(height: 32),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Заявка',
                  style: secondaryTextRegular17.copyWith(color: Colors.black),
                ),
                TextSpan(
                  text: ' №234523 ',
                  style: primaryTextSemiBold17,
                ),
                TextSpan(
                  text: 'отправлена.',
                  style: secondaryTextRegular17.copyWith(color: Colors.black),
                ),
              ])),
              const SizedBox(height: 16),
              Text(
                'Номер заявки можно найти в вашем профиле',
                textAlign: TextAlign.center,
                style: secondaryTextRegular17,
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
