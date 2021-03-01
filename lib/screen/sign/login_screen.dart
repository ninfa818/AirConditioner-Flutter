import 'package:aircondition/model/router_model.dart';
import 'package:aircondition/util/colors.dart';
import 'package:aircondition/util/dimens.dart';
import 'package:aircondition/util/themes.dart';
import 'package:aircondition/widget/appbar_widget.dart';
import 'package:aircondition/widget/bottom_widget.dart';
import 'package:aircondition/widget/button_widget.dart';
import 'package:aircondition/widget/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var usernameController = TextEditingController();
  var isContinue = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool authSignedIn;
  String uid;
  String userEmail;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  String name;
  String imageUrl;


  @override
  void initState() {
    super.initState();

    usernameController.addListener(() {
      String username = usernameController.text;
      if (username.isNotEmpty) {
        isContinue = true;
      } else {
        isContinue = false;
      }
      setState(() {

      });
    });
  }

  Future<String> signInWithGoogle() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    final User user = userCredential.user;

    if (user != null) {
      // Checking if email and name is null
      assert(user.uid != null);
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);

      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool('auth', true);

      return 'Google sign in successful, User UID: ${user.uid}';
    }

    return null;
  }

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
                                color: Colors.white,
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: dimension.sValue(offsetMd), vertical: dimension.sValue(offsetBase)),
                                  child: Column(
                                    children: [
                                      Text('Log in and get to work', style: extraTextStyle.copyWith(fontSize: dimension.sValue(14.0)),),
                                      SizedBox(height: dimension.sValue(offsetMd),),
                                      OutlineTextField(
                                        label: 'Username or Email',
                                        controller: usernameController,
                                        fontSize: dimension.sValue(10.0),
                                        sufficIcon: Icon(Icons.account_circle),
                                      ),
                                      SizedBox(height: dimension.sValue(offsetBase),),
                                      FullWidthButton(
                                        dimension: dimension,
                                        title: 'Continue',
                                        height: dimension.sValue(28.0),
                                        action: isContinue
                                            ? () {

                                        } : null,
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
                                                Text('Sign in with Wechat', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10.0), color: Colors.green),),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: dimension.sValue(offsetBase),),
                                      InkWell(
                                        onTap: () async {
                                          String result = await signInWithGoogle();
                                          print('google sign ===> $result');
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
                                                Text('Sign in with Google', style: boldTextStyle.copyWith(fontSize: dimension.sValue(10.0), color: Colors.red),),
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
                                        action: () {
                                          Navigator.pushReplacementNamed(context, routerRegister.routerName);
                                        },
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
