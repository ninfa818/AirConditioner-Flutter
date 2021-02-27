import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:flutter/material.dart';

class MenuTitleWidget extends StatefulWidget {
  const MenuTitleWidget({
    Key key,
    @required this.dimension,
    @required this.title,
    this.fontSize = 10.0,
    this.hoverColor = primaryColor,
  }) : super(key: key);

  final Dimension dimension;
  final String title;
  final double fontSize;
  final Color hoverColor;

  @override
  _MenuTitleWidgetState createState() => _MenuTitleWidgetState();

}

class _MenuTitleWidgetState extends State<MenuTitleWidget> {
  var isHover = false;

  @override
  void initState() {
    super.initState();

    isHover = false;
  }

  void _onExit(PointerEvent details) {
    setState(() {
      isHover = false;
    });
  }

  void _onEnter(PointerEvent details) {
    setState(() {
      isHover = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: Row(
        children: [
          Text(
            widget.title,
            style: extraTextStyle.copyWith(
                fontSize: widget.dimension.sValue(widget.fontSize),
              color: isHover? widget.hoverColor : Colors.black,
            ),
          ),
          SizedBox(
            width: offsetXSm,
          ),
          Icon(
            Icons.arrow_drop_down,
            color: isHover? widget.hoverColor : Colors.black,
          ),
        ],
      ),
    );
  }
}
