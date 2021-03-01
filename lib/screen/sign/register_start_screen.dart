import 'package:aircondition/model/router_model.dart';
import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:aircondition/widget/appbar_widget.dart';
import 'package:aircondition/widget/bottom_widget.dart';
import 'package:aircondition/widget/button_widget.dart';
import 'package:aircondition/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterStartScreen extends StatefulWidget {
  @override
  _RegisterStartScreenState createState() => _RegisterStartScreenState();
}

class _RegisterStartScreenState extends State<RegisterStartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var emailController = TextEditingController();
  var isContinue = false;

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      setState(() {
        String email = emailController.text;
        if (email.isNotEmpty) {
          isContinue = true;
        } else {
          isContinue = false;
        }
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: supportColor,
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
                      if (dimension.getStatus() > 0) Text('Already have an account? ', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10), color: Colors.white),),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, routerLogin.routerName);
                        },
                          child: Text('Login', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10), color: Colors.green),)
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 1024 / 2),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetLg),
                            child: Card(
                              color: Colors.white,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: dimension.sValue(offsetMd), vertical: dimension.sValue(offsetBase)),
                                child: Column(
                                  children: [
                                    Text('Get your free account', style: extraTextStyle.copyWith(fontSize: dimension.sValue(14.0)),),
                                    SizedBox(height: dimension.sValue(offsetBase),),
                                    InkWell(
                                      onTap: () async {

                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: dimension.sValue(32.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                                          border: Border.all(color: Colors.green),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Spacer(),
                                              SvgPicture.asset('assets/icons/ic_wechat.svg', height: dimension.sValue(16.0), color: Colors.green,),
                                              SizedBox(width: offsetSm,),
                                              Text('Continue with Wechat', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10.0), color: Colors.green),),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: dimension.sValue(offsetBase),),
                                    InkWell(
                                      onTap: () async {
                                        // String result = await signInWithGoogle();
                                        // print('google sign ===> $result');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: dimension.sValue(32.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(offsetSm)),
                                          border: Border.all(color: Colors.red),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Spacer(),
                                              SvgPicture.asset('assets/icons/ic_google.svg', height: dimension.sValue(16.0), color: Colors.red,),
                                              SizedBox(width: offsetSm,),
                                              Text('Continue with Google', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10.0), color: Colors.red),),
                                              Spacer(),
                                            ],
                                          ),
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
                                            Text('Continue with Apple', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10.0)),),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: dimension.sValue(offsetBase),),
                                    Row(
                                      children: [
                                        Expanded(child: Container(width: double.infinity, height: 0.5, color: Colors.grey,)),
                                        Text('   or   ', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10.0)),),
                                        Expanded(child: Container(width: double.infinity, height: 0.5, color: Colors.grey,)),
                                      ],
                                    ),
                                    SizedBox(height: dimension.sValue(offsetMd),),
                                    OutlineTextField(
                                      label: 'Work email address',
                                      controller: emailController,
                                      fontSize: dimension.sValue(10.0),
                                      sufficIcon: Icon(Icons.email),
                                    ),
                                    SizedBox(height: dimension.sValue(offsetBase),),
                                    FullWidthButton(
                                      dimension: dimension,
                                      title: 'Continue with Email',
                                      height: dimension.sValue(28.0),
                                      action: isContinue
                                          ? () {

                                      } : null,
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
                  )
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
