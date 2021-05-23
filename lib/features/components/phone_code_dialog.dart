import 'package:city_card_novoros/features/components/app_text_field.dart';
import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/buttons.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneCodeDialog extends StatefulWidget {
  final VoidCallback? onCodeSuccess;
  const PhoneCodeDialog({
    Key? key,
    this.onCodeSuccess,
  }) : super(key: key);

  @override
  _PhoneCodeDialogState createState() => _PhoneCodeDialogState();
}

class _PhoneCodeDialogState extends State<PhoneCodeDialog> {
  final _firstFocusNode = FocusNode();
  final _secondFocusNode = FocusNode();
  final _thirdFocusNode = FocusNode();
  final _fourthFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _firstFocusNode.requestFocus();
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BouncingButton(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(CupertinoIcons.clear_circled_solid)),
                ],
              ),
              Text(
                'Введите код из SMS',
                style: primaryTextSemiBold22,
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: AppTextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          focusNode: _firstFocusNode,
                          maxLength: 1,
                          onChanged: (text) {
                            if (text.isNotEmpty) {
                              _secondFocusNode.requestFocus();
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: AppTextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          focusNode: _secondFocusNode,
                          maxLength: 1,
                          onChanged: (text) {
                            if (text.isNotEmpty) {
                              _thirdFocusNode.requestFocus();
                            } else {
                              _firstFocusNode.requestFocus();
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: AppTextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          focusNode: _thirdFocusNode,
                          maxLength: 1,
                          onChanged: (text) {
                            if (text.isNotEmpty) {
                              _fourthFocusNode.requestFocus();
                            } else {
                              _secondFocusNode.requestFocus();
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: AppTextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          focusNode: _fourthFocusNode,
                          maxLength: 1,
                          onChanged: (text) {
                            if (text.isNotEmpty) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Navigator.of(context).pop();
                              widget.onCodeSuccess?.call();
                            } else {
                              _thirdFocusNode.requestFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AppButton(
                  backgroundColor: Colors.transparent,
                  child: Text(
                    'Отправить еще раз',
                    style: primaryTextSemiBold17,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
