import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class WebAppbarWidget extends StatelessWidget {
  final Dimension dimension;
  final String title;
  final Color textColor;
  final Widget body;
  final bool isShadow;
  final Color backgroundColor;
  final Function() onIconClick;

  const WebAppbarWidget({
    Key key,
    @required this.dimension,
    this.title,
    this.body,
    this.isShadow = false,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.onIconClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          if (isShadow) BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1024),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetBase),
          child: body == null
              ? Row(
                children: [
                  InkWell(
                      onTap: () {
                        onIconClick();
                      },
                      child: SvgPicture.asset('assets/icons/icon.svg', width: dimension.sValue(24.0), height: dimension.sValue(24.0),)
                  ),
                  SizedBox(width: offsetBase,),
                  Expanded(child: Center(
                    child: Text('Privacy Police', style: boldTextStyle.copyWith(fontSize: dimension.sValue(18.0), color: textColor),),
                  )),
                  SizedBox(width: offsetBase,),
                  Container(width: 36,),
                ],
              )
              : body,
        ),
      ),
    );
  }

}