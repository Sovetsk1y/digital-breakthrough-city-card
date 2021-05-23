import 'package:city_card_novoros/features/components/app_text_field.dart';
import 'package:city_card_novoros/features/components/back_button.dart';
import 'package:city_card_novoros/features/components/blur_overlay.dart';
import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/gradient_container.dart';
import 'package:city_card_novoros/features/components/phone_code_dialog.dart';
import 'package:city_card_novoros/features/components/role_provider.dart';
import 'package:city_card_novoros/utils/app_colors.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/pay_success_dialog.dart';

class SpendBonusesSelectedOptionPage extends StatefulWidget {
  SpendBonusesSelectedOptionPage({Key? key}) : super(key: key);

  @override
  _SpendBonusesSelectedOptionPageState createState() =>
      _SpendBonusesSelectedOptionPageState();
}

class _SpendBonusesSelectedOptionPageState
    extends State<SpendBonusesSelectedOptionPage> {
  final _phoneTextController = TextEditingController();
  final _bonusesTextController = TextEditingController();
  final _phoneFocusNode = FocusNode();

  bool _showingDialog = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Stack(
        children: [
          Scaffold(
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
              title: Text(
                'Бонусный счет',
                style: primaryTextSemiBold22,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        const SizedBox(width: 30),
                        Text(
                          '134,32',
                          style: primaryTextBold34,
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          CupertinoIcons.money_rubl_circle_fill,
                          size: 28,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 29),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Провайдер',
                            style: primaryTextSemiBold22.copyWith(
                                color: AppColors.grey2)),
                        const SizedBox(height: 16),
                        Image.asset(
                          'assets/images/mts.png',
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(height: 28),
                        Text('Укажите номер телефона',
                            style: primaryTextSemiBold22.copyWith(
                                color: AppColors.grey2)),
                        const SizedBox(height: 16),
                        AppTextField(
                          maxLength: 12,
                          controller: _phoneTextController,
                          focusNode: _phoneFocusNode,
                          keyboardType: TextInputType.phone,
                          placeholder: '+7XXXXXXXXXX',
                          onChanged: (text) {
                            if (_phoneTextController.text.length == 1 &&
                                text != '+') {
                              setState(() {
                                _phoneTextController.text = '+7$text';
                                _phoneTextController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset:
                                            _phoneTextController.text.length));
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 32),
                        Text('Укажите сумму',
                            style: primaryTextSemiBold22.copyWith(
                                color: AppColors.grey2)),
                        const SizedBox(height: 16),
                        AppTextField(
                          controller: _bonusesTextController,
                          keyboardType: TextInputType.number,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(CupertinoIcons.money_rubl_circle_fill),
                          ),
                          textStyle: primaryTextBold28,
                        ),
                        const SizedBox(height: 13),
                        Text('или',
                            style: primaryTextSemiBold22.copyWith(
                                color: AppColors.grey2)),
                        const SizedBox(height: 16),
                        BouncingButton(
                          onTap: () {
                            _bonusesTextController.text = '134,32';
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.1),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(
                              child: Text(
                                'Использовать все средства',
                                style: primaryTextSemiBold17.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BouncingButton(
                      onTap: () {
                        setState(() {
                          _showingDialog = true;
                        });
                        showDialog(
                          context: context,
                          useRootNavigator: false,
                          barrierColor: Colors.black26,
                          builder: (context) => PhoneCodeDialog(
                            onCodeSuccess: () {
                              setState(() {
                                _showingDialog = true;
                              });
                              showDialog(
                                context: context,
                                useRootNavigator: false,
                                barrierColor: Colors.black26,
                                builder: (context) => PaySuccessDialog(),
                              ).then((value) {
                                setState(() {
                                  _showingDialog = false;
                                });
                              });
                            },
                          ),
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
                              'Оплатить',
                              style: secondaryTextSemiBold17.copyWith(
                                  color: Colors.white),
                            ),
                          ),
                        ),
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
