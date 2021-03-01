import 'package:aircondition/model/router_model.dart';
import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/constants.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/params.dart';
import 'package:aircondition/util/themes.dart';
import 'package:aircondition/widget/text_widget.dart';
import 'package:flutter/material.dart';

class NoneBottomWidget extends StatelessWidget {
  final Dimension dimension;
  final Color backgroundColor;

  const NoneBottomWidget({
    Key key,
    this.dimension,
    this.backgroundColor = supportColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: dimension.sValue(offsetBase)),
      width: double.infinity,
      alignment: Alignment.center,
      color: backgroundColor,
      child: Center(
        child: Column(
          children: [
            Text(siteInformation, style: boldTextStyle.copyWith(fontSize: dimension.sValue(12.0), color: Colors.white),),
            SizedBox(height: dimension.sValue(offsetBase),),
            UnderLineHoverText(
              dimension: dimension,
              title: 'Terms of Services',
              textColor: Colors.white,
            ),
            SizedBox(height: dimension.sValue(offsetSm),),
            UnderLineHoverText(
              dimension: dimension,
              title: 'Privacy Policy',
              textColor: Colors.white,
              onClick: () {
                Navigator.pushNamed(context, routerPrivacyPolicy.routerName);
              },
            ),
            SizedBox(height: dimension.sValue(offsetSm),),
          ],
        ),
      ),
    );
  }
}
