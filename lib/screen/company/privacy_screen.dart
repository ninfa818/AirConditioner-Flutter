import 'package:aircondition/service/navigation_service.dart';
import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/params.dart';
import 'package:aircondition/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({
    Key key,
  }) : super(key: key);

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
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
                title: 'Privacy Police',
                textColor: Colors.white,
                backgroundColor: supportColor,
                onIconClick: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ),
    );
  }

}
