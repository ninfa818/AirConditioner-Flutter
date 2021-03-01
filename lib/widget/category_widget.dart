import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientCategoryWidget extends StatefulWidget {

  final Dimension dimension;
  final String title;
  final String description;
  final double titleFontSize;
  final double descFontSize;
  final Color hoverColor;

  const ClientCategoryWidget({
    Key key,
    @required this.dimension,
    @required this.title,
    @required this.description,
    this.titleFontSize = 18.0,
    this.descFontSize = 14.0,
    this.hoverColor = primaryColor,
  }) : super(key: key);

  @override
  _ClientCategoryWidgetState createState() => _ClientCategoryWidgetState();
}

class _ClientCategoryWidgetState extends State<ClientCategoryWidget> {
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
        child: Card(
          color: isHover? widget.hoverColor : Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(offsetBase),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                      style: boldTextStyle.copyWith(
                          fontSize: widget.titleFontSize,
                          color: isHover? Colors.white : Colors.green.withOpacity(0.8)
                      ),
                    ),
                    SizedBox(height: widget.dimension.sValue(offsetSm),),
                    Text(widget.description,
                      style: boldTextStyle.copyWith(
                          fontSize: widget.descFontSize,
                          color: isHover? Colors.white : Colors.grey,
                      ),
                    ),
                    SizedBox(height: widget.dimension.sValue(offsetSm),),
                  ],
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Container(
                    width: 50, height: 50,
                    color: isHover? Colors.white : widget.hoverColor,
                    child: Icon(Icons.arrow_forward, color: isHover? widget.hoverColor : Colors.white,),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}

class CategoryCellWidget extends StatefulWidget {
  final Dimension dimension;
  final String title;
  final Color color;
  final double fontSize;

  const CategoryCellWidget({
    Key key,
    @required this.dimension,
    @required this.title,
    this.color = Colors.black,
    this.fontSize = 12.0,
  }) : super(key: key);

  @override
  _CategoryCellWidgetState createState() => _CategoryCellWidgetState();
}

class _CategoryCellWidgetState extends State<CategoryCellWidget> {
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
        margin: EdgeInsets.all(offsetXSm),
        padding: EdgeInsets.symmetric(horizontal: offsetSm, vertical: offsetXSm),
        decoration: BoxDecoration(
          color: isHover? widget.color : Colors.white,
          border: Border.all(color: widget.color),
          borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
        ),
        child: Text(widget.title,
          style: mediumTextStyle.copyWith(
              fontSize: widget.dimension.sValue(widget.fontSize),
              color: isHover? Colors.white : widget.color
          ),
        ),
      ),
    );
  }
}
