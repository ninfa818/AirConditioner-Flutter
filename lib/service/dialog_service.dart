import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:flutter/material.dart';

enum SnackBarType {
  SUCCESS, WARING, INFO, ERROR
}

class DialogService {
  final BuildContext context;

  DialogService(this.context);

  void showSnackbar(
      String content,
      GlobalKey<ScaffoldState> _scaffoldKey,
      {
        SnackBarType type = SnackBarType.SUCCESS,
      }
      ) {
    var backgroundColor = Colors.white;
    switch (type) {
      case SnackBarType.SUCCESS:
        backgroundColor = Colors.green;
        break;
      case SnackBarType.WARING:
        backgroundColor = Colors.deepOrangeAccent;
        break;
      case SnackBarType.INFO:
        backgroundColor = primaryColor;
        break;
      case SnackBarType.ERROR:
        backgroundColor = Colors.red;
        break;
    }

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(offsetSm)),
        elevation: 2.0,
        child: Container(
          padding: EdgeInsets.all(offsetBase),
          child: Text(content, style: mediumTextStyle.copyWith(fontSize: 18.0, color: Colors.white),),
        ),
      ),
      backgroundColor: Colors.transparent,
      duration: Duration(milliseconds: 1500),
      elevation: 0,)
    );
  }

}

