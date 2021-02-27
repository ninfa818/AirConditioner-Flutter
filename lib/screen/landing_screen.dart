import 'package:aircondition/util/colors.dart';
import 'package:aircondition/widget/category_widget.dart';
import 'package:aircondition/widget/menu_title_widget.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:aircondition/widget/text_widget.dart';
import 'package:aircondition/widget/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
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
            return Column(
              children: [
                SizedBox(width: double.infinity, height: 0,),
                topBarWidget(dimension),
                Container(
                    color: Colors.black12,
                    alignment: Alignment.center,
                    child: menuBarWidget(dimension)
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: dimension.sValue(offsetBase),),
                        dimension.getStatus() > 1
                            ? advertiseWidgetLg(dimension)
                            : advertiseWidgetSm(dimension),
                        SizedBox(height: dimension.sValue(offsetXLg),),
                        clientSupportWidget(dimension),
                        SizedBox(height: dimension.sValue(offsetBase),),
                        dimension.getStatus() > 1
                            ? clientCategoryLg(dimension)
                            : clientCategorySm(dimension),
                        SizedBox(height: dimension.sValue(offsetBase),),
                        dimension.getStatus() > 1
                            ? Row(
                          children: [
                            Spacer(),
                            Text('Need a solution for large organizations? ', style: extraTextStyle.copyWith(fontSize: dimension.sValue(10.0)),),
                            UnderLineHoverText(
                              dimension: dimension,
                              title: 'Enterprise Suite has you covered.',
                              onClick: () {

                              },
                            ),
                            Spacer(),
                          ],
                        )
                            : Column(
                          children: [
                            Text('Need a solution for large organizations? ', style: extraTextStyle.copyWith(fontSize: dimension.sValue(10.0)),),
                            SizedBox(height: offsetSm,),
                            UnderLineHoverText(
                              dimension: dimension,
                              title: 'Enterprise Suite has you covered.',
                              onClick: () {

                              },
                            ),
                          ],
                        ),
                        SizedBox(height: dimension.sValue(offsetXLg),),
                        dimension.getStatus() > 1
                            ? jobCategoryLg(dimension)
                            : jobCategorySm(dimension),
                        SizedBox(height: dimension.sValue(offsetXLg),),
                        talentSupportWidget(dimension),
                        SizedBox(height: dimension.sValue(offsetBase),),
                        dimension.getStatus() > 2
                            ? talentCategoryLg(dimension)
                            : talentCategorySm(dimension),

                        SizedBox(height: dimension.sValue(offsetXLg),),
                      ],
                    ),
                  ),
                ),
              ],
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
            if (dimension.getStatus() < 4)
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
            if (dimension.getStatus() > 3)
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
            ColorHoverText(dimension: dimension, title: 'Sales & Marketing', onClick: () {
              print('Sales & Marketing');
            },),
            SizedBox(width: dimension.sValue(offsetLg),),
            ColorHoverText(dimension: dimension, title: 'Jobs & Services', onClick: () {
              print('Jobs & Services');
            },),
            SizedBox(width: dimension.sValue(offsetLg),),
            ColorHoverText(dimension: dimension, title: 'Admin & Customer', onClick: () {
              print('Admin & Customer');
            },),
          ],
        ),
      ),
    );
  }

  Widget advertiseWidgetLg(Dimension dimension) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 1024),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: offsetBase),
        child: Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: dimension.sValue(offsetBase),),
                Text('The world\'s work \nmarketplace', style: extraTextStyle.copyWith(fontSize: dimension.sValue(18.0), color: Colors.green.withOpacity(0.8)),),
                SizedBox(height: dimension.sValue(offsetBase),),
                Text('Engage the largest network of trusted\nindependent professionals to unlock\nthe full potential of your business.', style: boldTextStyle.copyWith(fontSize: dimension.sValue(12.0)),),
                SizedBox(height: dimension.sValue(offsetBase),),
                Row(
                  children: [
                    Expanded(child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: dimension.sValue(offsetSm)),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                      ),
                      child: Text('Find Talent', style: extraTextStyle.copyWith(fontSize: 12, color: Colors.white),),
                    )),
                    SizedBox(width: dimension.sValue(offsetBase),),
                    Expanded(child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: dimension.sValue(offsetSm)),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                      ),
                      child: Text('Find Work', style: extraTextStyle.copyWith(fontSize: 12, color: primaryColor),),
                    )),
                  ],
                ),
              ],
            )),
            SizedBox(width: dimension.sValue(offsetLg),),
            Expanded(child: Container(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                  child: Image.asset('assets/images/img_adv.png', fit: BoxFit.fitWidth,)),
            )),
          ],
        ),
      ),
    );
  }

  Widget advertiseWidgetSm(Dimension dimension) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: offsetBase),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('The world\'s work \nmarketplace', style: extraTextStyle.copyWith(fontSize: dimension.sValue(28.0)),),
              SizedBox(height: dimension.sValue(offsetBase),),
              Text('Engage the largest network of trusted\nindependent professionals to unlock\nthe full potential of your business.', style: boldTextStyle.copyWith(fontSize: dimension.sValue(16.0)),),
              SizedBox(height: dimension.sValue(offsetBase),),
              Row(
                children: [
                  Expanded(child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: dimension.sValue(offsetSm)),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                    ),
                    child: Text('Find Talent', style: mediumTextStyle.copyWith(fontSize: 14, color: Colors.white),),
                  )),
                  SizedBox(width: dimension.sValue(offsetBase),),
                  Expanded(child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: dimension.sValue(offsetSm)),
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                    ),
                    child: Text('Find Work', style: mediumTextStyle.copyWith(fontSize: 14, color: primaryColor),),
                  )),
                ],
              ),
            ],
          ),
          SizedBox(height: dimension.sValue(offsetMd),),
          AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset('assets/images/img_adv.png', fit: BoxFit.fitWidth,)),
        ],
      ),
    );
  }

  Widget clientSupportWidget(Dimension dimension) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dimension.sValue(dimension.getStatus() > 1? offsetLg : offsetBase)),
      child: Column(
        children: [
          Text('FOR CLIENT', style: boldTextStyle.copyWith(fontSize: dimension.sValue(12.0), color: Colors.grey),),
          SizedBox(height: dimension.sValue(offsetMd),),
          Text('Find talent your way', style: boldTextStyle.copyWith(fontSize: dimension.sValue(22.0), color: Colors.green.withOpacity(0.8)),),
          SizedBox(height: dimension.sValue(offsetMd),),
          Text('Develop trusted relationships and build your own virtual talent bench for quick project turnarounds or big transformations.',
            style: mediumTextStyle.copyWith(fontSize: dimension.sValue(11.0)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget clientCategoryLg(Dimension dimension) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 1024),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: offsetLg),
        child: Row(
          children: [
            Expanded(child: ClientCategoryWidget(
              dimension: dimension,
              title: dimension.getStatus() == 4? 'Post a job and hire a proj' : 'Post a job and\nhire a proj',
              description: 'Talent Marketplace',
            )),
            SizedBox(width: dimension.sValue(offsetBase),),
            Expanded(child: ClientCategoryWidget(
              dimension: dimension,
              title: dimension.getStatus() == 4? 'Shop ready-to-go projects' : 'Shop ready-to-\ngo projects',
              description: 'Project Category',
            )),
            SizedBox(width: dimension.sValue(offsetBase),),
            Expanded(child: ClientCategoryWidget(
              dimension: dimension,
              title: dimension.getStatus() == 4? 'Let us find the right talent' : 'Let us find the\nright talent',
              description: 'Talent Scout',
            )),
          ],
        ),
      ),
    );
  }

  Widget clientCategorySm(Dimension dimension) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: offsetBase),
      child: Column(
        children: [
          ClientCategoryWidget(
            dimension: dimension,
            title: 'Post a job and hire a pro',
            description: 'Talent Marketplace',
          ),
          SizedBox(height: dimension.sValue(offsetBase),),
          ClientCategoryWidget(
            dimension: dimension,
            title: 'Shop ready-to-go projects',
            description: 'Project Category',
          ),
          SizedBox(height: dimension.sValue(offsetBase),),
          ClientCategoryWidget(
            dimension: dimension,
            title: 'Let us find the right talent',
            description: 'Talent Scout',
          )
        ],
      ),
    );
  }


  var airConCategories = [
    'Types of AC Units',
    'Central Air Conditioners',
    'Ductless Air Conditioners',
    'Mini-Split Air Conditioners',
    'Window Units',
    'Portable Units',
    'Hybrid Air Conditioner',
    'Geothermal Heating',
    'Geothermal Cooling',
  ];

  Widget jobCategoryLg(Dimension dimension) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 1024),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: offsetLg),
        child: Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColorHoverText(
                  dimension: dimension,
                  title: 'Sales & Marketing',
                  fontSize: dimension.sValue(18.0),
                ),
                SizedBox(height: dimension.sValue(offsetSm),),
                ColorHoverText(
                  dimension: dimension,
                  title: 'Job & Services',
                  fontSize: dimension.sValue(18.0),
                ),
                SizedBox(height: dimension.sValue(offsetSm),),
                ColorHoverText(
                  dimension: dimension,
                  title: 'Admin & Customer',
                  fontSize: dimension.sValue(18.0),
                ),
              ],
            )),
            SizedBox(width: dimension.sValue(offsetBase),),
            Expanded(child: Wrap(
              children: [
                for (var condition in airConCategories) Container(
                  margin: EdgeInsets.all(offsetXSm),
                  padding: EdgeInsets.symmetric(horizontal: offsetSm, vertical: offsetXSm),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                  ),
                  child: Text(condition, style: mediumTextStyle.copyWith(fontSize: dimension.sValue(10.0)),),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget jobCategorySm(Dimension dimension) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: offsetBase),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColorHoverText(
                dimension: dimension,
                title: 'Sales & Marketing',
                fontSize: dimension.sValue(22.0),
              ),
              SizedBox(height: dimension.sValue(offsetSm),),
              ColorHoverText(
                dimension: dimension,
                title: 'Job & Services',
                fontSize: dimension.sValue(22.0),
              ),
              SizedBox(height: dimension.sValue(offsetSm),),
              ColorHoverText(
                dimension: dimension,
                title: 'Admin & Customer',
                fontSize: dimension.sValue(22.0),
              ),
              SizedBox(height: dimension.sValue(offsetBase),),
              Wrap(
                children: [
                  for (var condition in airConCategories) Container(
                    margin: EdgeInsets.all(offsetXSm),
                    padding: EdgeInsets.symmetric(horizontal: offsetSm, vertical: offsetXSm),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                    ),
                    child: Text(condition, style: mediumTextStyle.copyWith(fontSize: dimension.sValue(12.0)),),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget talentSupportWidget(Dimension dimension) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dimension.sValue(dimension.getStatus() > 1? offsetLg : offsetBase)),
      child: Column(
        children: [
          Text('FOR TALENT', style: boldTextStyle.copyWith(fontSize: dimension.sValue(12.0), color: Colors.grey),),
          SizedBox(height: dimension.sValue(offsetMd),),
          Text('Work your way', style: boldTextStyle.copyWith(fontSize: dimension.sValue(22.0), color: Colors.green.withOpacity(0.8)),),
          SizedBox(height: dimension.sValue(offsetMd),),
          Text('Choose how you work, and unlock 141,182 new opportunities to earn.',
            style: mediumTextStyle.copyWith(fontSize: dimension.sValue(11.0)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget talentCategoryLg(Dimension dimension) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 1024),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: offsetLg),
        child: Row(
          children: [
            Expanded(child: Container(), flex: 1,),
            SizedBox(width: dimension.sValue(offsetBase),),
            Expanded(child: ClientCategoryWidget(
              dimension: dimension,
              title: dimension.getStatus() == 4? 'Find a project to work on' : 'Find a project to\nwork on',
              description: 'Talent Marketplace',
            ), flex: 2,),
            SizedBox(width: dimension.sValue(offsetBase),),
            Expanded(child: ClientCategoryWidget(
              dimension: dimension,
              title: dimension.getStatus() == 4? 'Sell a predefined project' : 'Sell a predefined\nproject',
              description: 'Project Category',
            ), flex: 2,),
            SizedBox(width: dimension.sValue(offsetBase),),
            Expanded(child: Container(), flex: 1,),
          ],
        ),
      ),
    );
  }

  Widget talentCategorySm(Dimension dimension) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: offsetBase),
      child: Column(
        children: [
          ClientCategoryWidget(
            dimension: dimension,
            title: 'Find a project to work on',
            description: 'Talent Marketplace',
          ),
          SizedBox(height: dimension.sValue(offsetBase),),
          ClientCategoryWidget(
            dimension: dimension,
            title: 'Sell a predefined project',
            description: 'Project Category',
          ),
        ],
      ),
    );
  }



}
