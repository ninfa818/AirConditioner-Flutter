import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:flutter/material.dart';

class FullWidthButton extends FlatButton {
  FullWidthButton({
    Key key,
    Dimension dimension,
    String title,
    Widget customTitleWidget,
    Color color = primaryColor,
    void Function() action,
    Color textColor = Colors.white,
    double buttonRadius = 8.0,
    double height = 48.0,
  }) : super(
    key: key,
    child: Container(
      height: height,
      alignment: Alignment.center,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: customTitleWidget == null
          ? Text(
        title,
        textAlign: TextAlign.center,
        style: boldTextStyle.copyWith(fontSize: dimension.sValue(10.0), color: textColor?? Colors.white),
      )
          : customTitleWidget,
    ),
    onPressed: action,
    color: color,
    disabledColor: color.withOpacity(0.5),
    textColor: textColor,
    disabledTextColor: textColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonRadius),
    ),
  );
}