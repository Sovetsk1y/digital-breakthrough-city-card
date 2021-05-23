import 'package:city_card_novoros/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final int? maxLength;
  final String? placeholder;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;

  const AppTextField({
    Key? key,
    this.placeholder,
    this.textAlign,
    this.maxLength,
    this.controller,
    this.keyboardType,
    this.textStyle,
    this.inputFormatters,
    this.focusNode,
    this.suffix,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      maxLength: maxLength,
      controller: controller,
      textAlign: textAlign ?? TextAlign.start,
      focusNode: focusNode,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      suffix: suffix,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      placeholder: placeholder,
      style: textStyle ?? secondaryTextSemiBold17.copyWith(color: Colors.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.black.withOpacity(.08),
      ),
      textCapitalization: TextCapitalization.characters,
      placeholderStyle: secondaryTextSemiBold17.copyWith(color: Colors.black26),
      onChanged: onChanged,
    );
  }
}
