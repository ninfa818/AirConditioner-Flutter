import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FollowIconWidget extends StatefulWidget {
  final String iconName;
  final double iconSize;
  final Color iconColor;
  final Color backgroundColor;
  final Color hoverColor;

  const FollowIconWidget({
    Key key,
    @required this.iconName,
    @required this.backgroundColor,
    @required this.hoverColor,
    this.iconSize = 30.0,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  _FollowIconWidgetState createState() => _FollowIconWidgetState();
}

class _FollowIconWidgetState extends State<FollowIconWidget> {
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
      child: Container(
        width: widget.iconSize,
        height: widget.iconSize,
        decoration: BoxDecoration(
          color: isHover? widget.hoverColor : widget.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(widget.iconSize / 2)),
        ),
        child: Center(
          child: SvgPicture.asset(
            widget.iconName,
            width: widget.iconSize / 2,
            height: widget.iconSize / 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
