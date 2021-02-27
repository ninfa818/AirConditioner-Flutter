import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/themes.dart';
import 'package:flutter/material.dart';

class TitleBarWidget extends AppBar {
  final String titleString;
  final Color backgroundColor;
  final double height;
  final Widget titleWidget;
  final Widget backIcon;

  TitleBarWidget({
    Key key,
    this.titleString,
    this.backgroundColor = primaryColor,
    this.height = kToolbarHeight,
    this.titleWidget,
    this.backIcon,
    @required BuildContext context,
    List<IconButton> actions
  }) : super(
    backgroundColor: backgroundColor,
    brightness: Brightness.dark,
    toolbarHeight: height,
    title: titleString == null
        ? titleWidget
        : Text(titleString, style: boldTextStyle.copyWith(fontSize: 28, color: Colors.white),),
    leading: backIcon == null
        ? IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        )
        : backIcon,
    actions: actions
  );
}