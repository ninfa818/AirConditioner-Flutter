import 'package:aircondition/util/colors.dart';
import 'package:aircondition/widget/menu_title_widget.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:aircondition/widget/text_widget.dart';
import 'package:aircondition/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var isTalentHover;
  var searchController = TextEditingController();


  @override
  void initState() {
    super.initState();

    isTalentHover = false;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        body: LayoutBuilder(
          builder: (context, constraint) {
            Dimension dimension = Dimension(MediaQuery.of(context).size);
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(width: double.infinity, height: 0,),
                  topBarWidget(dimension),
                  Container(
                    color: Colors.black12,
                    alignment: Alignment.center,
                    child: menuBarWidget(dimension)
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topBarWidget(Dimension dimension) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 1024),
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetBase),
        child: Row(
          children: [
            if (dimension.getStatus() < 3)
              Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: dimension.sValue(18),
                  ),
                  SizedBox(
                    width: offsetBase,
                  ),
                ],
              ),
            Image.asset(
              'assets/images/logo.png',
              height: dimension.sValue(kToolbarHeight * 0.5),
            ),
            if (dimension.getStatus() > 2)
              Row(
                children: [
                  SizedBox(
                    width: dimension.sValue(offsetLg),
                  ),
                  MenuTitleWidget(
                    dimension: dimension,
                    title: 'Find Talent',
                  ),
                  SizedBox(
                    width: dimension.sValue(offsetBase),
                  ),
                  MenuTitleWidget(
                    dimension: dimension,
                    title: 'Find Work',
                  ),
                ],
              ),
            Spacer(),
            if (dimension.getStatus() > 1)
              Row(
                children: [
                  Container(
                    width: dimension.sValue(150),
                    padding: EdgeInsets.symmetric(horizontal: offsetBase),
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: primaryColor,
                          size: dimension.sValue(12.0),
                        ),
                        SizedBox(
                          width: offsetXSm,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: offsetXSm,
                        ),
                        Expanded(
                            child: NoneTextFieldWidget(
                              controller: searchController,
                              label: 'Search',
                              fontSize: dimension.sValue(10.0),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: offsetBase,
                  ),
                  Container(
                    width: 2,
                    height: kToolbarHeight * 0.5,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: offsetXMd,
                  ),
                ],
              ),
            Text(
              'Login',
              style:
              extraTextStyle.copyWith(fontSize: dimension.sValue(10.0)),
            ),
            SizedBox(
              width: offsetMd,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetSm),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(offsetSm))),
                child: Text(
                  'Register',
                  style: extraTextStyle.copyWith(
                      fontSize: dimension.sValue(10.0), color: Colors.white),
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget menuBarWidget(Dimension dimension) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 1024),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetBase),
        child: Row(
          children: [
            HoverText(dimension: dimension, title: 'Sales & Marketing', onClick: () {
              print('Sales & Marketing');
            },),
            SizedBox(width: dimension.sValue(offsetLg),),
            HoverText(dimension: dimension, title: 'Jobs & Services'),
            SizedBox(width: dimension.sValue(offsetLg),),
            HoverText(dimension: dimension, title: 'Admin & Customer'),
          ],
        ),
      ),
    );
  }
}
