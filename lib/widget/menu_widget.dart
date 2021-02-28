import 'package:aircondition/util/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key key,
    @required this.dimention,
    @required this.body,
    this.pWidth = 100,
    this.isMenu = false,
    this.during = 1000,
    this.onExtraEvent,
  }) : super(key: key);

  final Dimension dimention;
  final double pWidth;
  final Widget body;
  final bool isMenu;
  final int during;
  final Function() onExtraEvent;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: during),
      curve: Curves.fastOutSlowIn,
      transform: Matrix4.translationValues(isMenu? 0 : -dimention.wp(pWidth), 0, 0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: body,
      ),
    );
  }
}