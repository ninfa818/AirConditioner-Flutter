import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final Dimension dimension;
  final Color hoverColor;
  final String title;
  final double fontSize;
  final Function() onClick;

  const HoverText({
    Key key,
    @required this.dimension,
    @required this.title,
    this.hoverColor = primaryColor,
    this.fontSize = 9.0,
    this.onClick,
  }) : super(key: key);

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
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
      child: InkWell(
        onTap: () {
          widget.onClick();
        },
        child: Text(
          widget.title,
          style: boldTextStyle.copyWith(
            fontSize: widget.dimension.sValue(widget.fontSize),
            color: isHover? widget.hoverColor : Colors.black,
          ),
        ),
      ),
    );
  }
}
