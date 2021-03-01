import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:aircondition/widget/appbar_widget.dart';
import 'package:aircondition/widget/bottom_widget.dart';
import 'package:aircondition/widget/button_widget.dart';
import 'package:aircondition/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: supportColor,
        key: _scaffoldKey,
        body: LayoutBuilder(
          builder: (context, constraint) {
            Dimension dimension = Dimension(MediaQuery.of(context).size);
            return Column(
              children: [
                WebAppbarWidget(
                  dimension: dimension,
                  backgroundColor: supportColor,
                  body: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                          child: Image.asset('assets/images/logo.png', height: dimension.sValue(36),)
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 1024 / 2),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetLg),
                              child: Card(
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: dimension.sValue(offsetMd), vertical: dimension.sValue(offsetBase)),
                                  child: Column(
                                    children: [
                                      Text('Log in and get to work', style: extraTextStyle.copyWith(fontSize: dimension.sValue(14.0)),),
                                      SizedBox(height: dimension.sValue(offsetMd),),
                                      OutlineTextField(
                                        label: 'Username or Email',
                                        fontSize: dimension.sValue(10.0),
                                        sufficIcon: Icon(Icons.account_circle),
                                      ),
                                      SizedBox(height: dimension.sValue(offsetBase),),
                                      FullWidthButton(
                                        dimension: dimension,
                                        title: 'Continue',
                                        height: dimension.sValue(28.0),
                                      ),
                                      SizedBox(height: dimension.sValue(offsetBase),),
                                      Row(
                                        children: [
                                          Expanded(child: Container(width: double.infinity, height: 0.5, color: Colors.grey,)),
                                          Text('   or   ', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10.0)),),
                                          Expanded(child: Container(width: double.infinity, height: 0.5, color: Colors.grey,)),
                                        ],
                                      ),
                                      SizedBox(height: dimension.sValue(offsetBase),),
                                      Container(
                                        width: double.infinity,
                                        height: dimension.sValue(32.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                                          border: Border.all(color: Colors.grey),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Spacer(),
                                              SvgPicture.asset('assets/icons/ic_google.svg', height: dimension.sValue(16.0),),
                                              SizedBox(width: offsetSm,),
                                              Text('Sign in with Google', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10.0)),),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: dimension.sValue(offsetBase),),
                                      Container(
                                        width: double.infinity,
                                        height: dimension.sValue(32.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                                          border: Border.all(color: Colors.grey),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Spacer(),
                                              SvgPicture.asset('assets/icons/ic_apple.svg', height: dimension.sValue(16.0),),
                                              SizedBox(width: offsetSm,),
                                              Text('Sign in with Apple', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10.0)),),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: dimension.sValue(offsetLg),),
                                      Row(
                                        children: [
                                          Expanded(child: Container(width: double.infinity, height: 0.5, color: Colors.grey,)),
                                          Text('   New to AirCondition ?   ', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10.0)),),
                                          Expanded(child: Container(width: double.infinity, height: 0.5, color: Colors.grey,)),
                                        ],
                                      ),
                                      SizedBox(height: dimension.sValue(offsetBase),),
                                      FullWidthButton(
                                        dimension: dimension,
                                        title: 'Sign Up',
                                        height: dimension.sValue(28.0),
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          NoneBottomWidget(
                            dimension: dimension,
                          ),
                        ],
                      ),
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
}
