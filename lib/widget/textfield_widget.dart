import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:flutter/material.dart';

class NoneTextFieldWidget extends TextField {
  final bool isReadOnly;
  final bool isDisable;
  final TextEditingController controller;
  final String label;
  final double fontSize;
  final Widget sufficIcon;
  final TextInputType keyboardType;
  final Function(String) onEnterTrigger;
  final String errorText;
  final bool isPassword;

  NoneTextFieldWidget({
    Key key,
    this.isReadOnly = false,
    this.isDisable = false,
    this.controller,
    this.label,
    this.fontSize = 18.0,
    this.sufficIcon,
    this.keyboardType = TextInputType.text,
    this.onEnterTrigger,
    this.errorText,
    this.isPassword = false,
  }) : super(
    key: key,
    controller: controller,
    keyboardType: keyboardType,
    textInputAction: onEnterTrigger != null? TextInputAction.go : null,
    obscureText: isPassword,
    readOnly: isReadOnly,
    decoration: InputDecoration(
      enabled: !isDisable,
      contentPadding: EdgeInsets.zero,
      hintText: label,
      hintStyle: extraTextStyle.copyWith(fontSize: fontSize),
      focusedBorder: InputBorder.none,
      border: InputBorder.none,
      errorBorder: InputBorder.none,
      suffix: sufficIcon,
      suffixIconConstraints: BoxConstraints(
        maxWidth: 24,
        maxHeight: 24,
        minHeight: 24,
        minWidth: 24,
      ),
      errorText: errorText,
      errorStyle: mediumTextStyle.copyWith(fontSize: fontSize, color: Colors.red),
    ),
  );
}

class OutlineTextField extends TextField {
  final bool isReadOnly;
  final bool isDisable;
  final TextEditingController controller;
  final String label;
  final String hint;
  final double fontSize;
  final Widget prefixIcon;
  final Widget sufficIcon;
  final TextInputType keyboardType;
  final Function(String) onEnterTrigger;
  final String errorText;
  final bool isPassword;

  OutlineTextField({
    Key key,
    this.isReadOnly = false,
    this.isDisable = false,
    this.controller,
    this.label,
    this.hint,
    this.fontSize,
    this.prefixIcon,
    this.sufficIcon,
    this.keyboardType,
    this.onEnterTrigger,
    this.errorText,
    this.isPassword = false,
  }) : super(
    key: key,
    controller: controller,
    keyboardType: keyboardType,
    textInputAction: onEnterTrigger != null? TextInputAction.go : null,
    obscureText: isPassword,
    readOnly: isReadOnly,
    decoration: InputDecoration(
      enabled: !isDisable,
      labelText: label,
      labelStyle: mediumTextStyle.copyWith(fontSize: fontSize),
      hintText: hint,
      hintStyle: mediumTextStyle.copyWith(fontSize: fontSize),
      contentPadding: EdgeInsets.symmetric(horizontal: offsetBase),
      prefixIcon: prefixIcon,
      suffixIcon: sufficIcon,
      border: OutlineInputBorder(),
      errorText: errorText,
      errorStyle: mediumTextStyle.copyWith(fontSize: fontSize, color: Colors.red),
    ),
  );
}
