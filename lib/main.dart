import 'package:aircondition/screen/landing_screen.dart';
import 'package:flutter/material.dart';

import 'model/router_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AirCondition',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingScreen(),
        routerLogin.routerName: (context) => routerLogin.routerWidget,
        routerRegister.routerName: (context) => routerRegister.routerWidget,
        routerPrivacyPolicy.routerName: (context) => routerPrivacyPolicy.routerWidget,
      },
      // home: LandingScreen(),
    );
  }
}
