import 'package:flutter/material.dart';

class NavigationService {
  void NavigationRouter(
      BuildContext context,
      Widget screen,
      {
        bool replace = false,
        Function(dynamic) navigatorPop,
        bool isAnimation = true,
      }) {
    if (replace) {
      (isAnimation)
          ? Navigator.of(context).pushReplacement(
          MaterialPageRoute<Object>(
              builder: (context) => screen
          )
      ).then((value) => {
        if (navigatorPop != null) navigatorPop(value)
      })
          : Navigator.of(context).pushReplacement(
        PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => screen,
            transitionDuration: Duration(seconds: 0)),
      ).then((value) => {
        if (navigatorPop != null) navigatorPop(value)
      });
    } else {
      (isAnimation)
      ? Navigator.of(context).push(
          MaterialPageRoute<Object>(
              builder: (context) => screen
          )
      ).then((value) => {
        if (navigatorPop != null) navigatorPop(value)
      })
      : Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => screen,
            transitionDuration: Duration(seconds: 0)),
      ).then((value) => {
        if (navigatorPop != null) navigatorPop(value)
      });
    }
  }
}