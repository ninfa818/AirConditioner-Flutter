import 'package:flutter/material.dart';

class NavigationService {
  void NavigationRouter(
      BuildContext context,
      Widget screen,
      {
        bool replace = false,
        Function(dynamic) navigatorPop,
      }) {
    if (replace) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute<Object>(
              builder: (context) => screen
          )
      ).then((value) => {
        if (navigatorPop != null) navigatorPop(value)
      });
    } else {
      Navigator.of(context).push(
          MaterialPageRoute<Object>(
              builder: (context) => screen
          )
      ).then((value) => {
        if (navigatorPop != null) navigatorPop(value)
      });
    }
  }
}