import 'package:aircondition/screen/company/privacy_screen.dart';
import 'package:aircondition/screen/sign/login_screen.dart';
import 'package:aircondition/screen/sign/register_screen.dart';
import 'package:flutter/cupertino.dart';

var routerLogin = RouterModel(routerName: '/login', routerWidget: LoginScreen());
var routerRegister = RouterModel(routerName: '/register', routerWidget: RegisterScreen());
var routerPrivacyPolicy = RouterModel(routerName: '/privacy_policy', routerWidget: PrivacyScreen());

class RouterModel {
  String routerName;
  Widget routerWidget;

  RouterModel({
    this.routerName,
    this.routerWidget,
  });
}