import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:flutter/material.dart';

class ColorHoverText extends StatefulWidget {
  final Dimension dimension;
  final Color hoverColor;
  final String title;
  final double fontSize;
  final Function() onClick;

  const ColorHoverText({
    Key key,
    @required this.dimension,
    @required this.title,
    this.hoverColor = primaryColor,
    this.fontSize = 9.0,
    this.onClick,
  }) : super(key: key);

  @override
  _ColorHoverTextState createState() => _ColorHoverTextState();
}

class _ColorHoverTextState extends State<ColorHoverText> {
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

class UnderLineHoverText extends StatefulWidget {
  final Dimension dimension;
  final String title;
  final Color textColor;
  final double fontSize;
  final Function() onClick;

  const UnderLineHoverText({
    Key key,
    this.dimension,
    this.title,
    this.textColor = primaryColor,
    this.fontSize = 10.0,
    this.onClick
  }) : super(key: key);

  @override
  _UnderLineHoverTextState createState() => _UnderLineHoverTextState();
}

class _UnderLineHoverTextState extends State<UnderLineHoverText> {
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
            decoration: isHover? TextDecoration.underline : TextDecoration.none,
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
