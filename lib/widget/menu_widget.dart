import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/constants.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:aircondition/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
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

class MainMenuWidget extends StatefulWidget {
  final Dimension dimension;

  const MainMenuWidget({
    Key key,
    @required this.dimension
  }) : super(key: key);

  @override
  _MainMenuWidgetState createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  var openIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: supportColor,
      padding: EdgeInsets.all(widget.dimension.sValue(offsetBase)),
      child: Column(
        children: [
          for (var menu in menuData) Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    openIndex = menuData.indexOf(menu);
                  });
                },
                child: Row(
                  children: [
                    Text(menu['title'],
                      style: mediumTextStyle.copyWith(
                          fontSize: widget.dimension.sValue(18.0),
                          color: Colors.white),
                    ),
                    SizedBox(width: offsetSm,),
                    Icon(
                      openIndex == menuData.indexOf(menu)? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              if (openIndex == menuData.indexOf(menu)) Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: widget.dimension.sValue(offsetSm),),
                  for (var item in menu['sub']) Container(
                    padding: EdgeInsets.all(widget.dimension.sValue(offsetSm)),
                    child: UnderLineHoverText(
                      dimension: widget.dimension,
                      title: item,
                      textColor: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: widget.dimension.sValue(offsetBase),),
            ],
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: widget.dimension.sValue(offsetSm)),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
            ),
            child: Text('Visit Tour', style: mediumTextStyle.copyWith(fontSize: 14, color: Colors.white),),
          ),
          SizedBox(height: widget.dimension.sValue(offsetBase),),
        ],
      ),
    );
  }
}
