import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: LayoutBuilder(
        builder: (context, constraint) {
          Dimension dimension = Dimension(MediaQuery.of(context).size);
          return Column(
            children: [
              WebAppbarWidget(
                dimension: dimension,
                backgroundColor: supportColor,
                body: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                        child: Image.asset('assets/images/logo.png', height: dimension.sValue(36),)
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
