import 'package:aircondition/util/colors.dart';
import 'package:aircondition/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBarWidget(
        context: context,
        height: 128,
        backgroundColor: Colors.white,
        titleWidget: Image.asset('assets/images/logo.png', height: 75,),
        backIcon: Icon(Icons.arrow_back_ios, color: Colors.white,),
      ),
      body: SvgPicture.asset('assets/icons/icon.svg'),
    );
  }
}
