import 'package:aidiva_pro/components/CustomButton.dart';
import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:aidiva_pro/components/customtextstyle.dart';
import 'package:aidiva_pro/page/authentication/LoginEmailPage.dart';
import 'package:aidiva_pro/page/authentication/LoginMobilePage.dart';
import 'package:aidiva_pro/page/authentication/register.dart';
import 'package:aidiva_pro/page/otherpages/Weview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginOptionPage extends StatefulWidget {
  @override
  _LoginOptionPage createState() => _LoginOptionPage();
}

class _LoginOptionPage extends State<LoginOptionPage> {
  @override
  Widget build(BuildContext context) {
    double device_width = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Material(
        color: Primarycolor,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                height: device_height * 0.26,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login_bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: device_height * 0.16,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                       child: Column(
                          children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Register()));
                                      },
                                      child: Text(
                                        'Sign up',
                                        style: CustomTextStyle.content2white(
                                            context),
                                      )),
                                ),
                            SizedBox(height: device_height*0.015),
                            Container(
                              width: device_width,
                              height: device_height*0.08,
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(Icons.arrow_back_ios,
                                              color: Colors.white),
                                        ),
                                        Spacer(flex: 4),
                                      ],
                                    ),
                                    Container(
                                      child: Image.asset(
                                          'assets/images/register_bg.png',
                                          width: device_width * 0.29,
                                          height: device_height * 0.085,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: device_width*0.08),
                                  ]),
                            ),
                          ],
                        ),

                      ),
                    )),
              ),
              SizedBox(height: device_height * 0.05),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Welcome',
                          style: CustomTextStyle.heading(context),
                        ),
                      ),
                      SizedBox(height: device_height * 0.02),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Login to continue',
                          style: CustomTextStyle.contenetsixteen(context),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginMobilePage()));
                              },
                              child: Container(
                                width: device_width * 0.87,
                                height: device_height * 0.057,
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(width: 1.5, color: Colors.grey[350]),
                                  borderRadius: BorderRadius.all(Radius.circular(22.0)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.call, color: Colors.black),
                                    Text(
                                      'Continue with phone',
                                      style: TextStyle(
                                          color: Headingtextcolor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(width: device_width*0.05,),
                                  ],
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: device_height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginEmailPage()));
                              },
                              child: Container(
                                width: device_width * 0.87,
                                height: device_height * 0.057,
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(width: 1.5, color: Colors.grey[350]),
                                  borderRadius: BorderRadius.all(Radius.circular(22.0)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.email, color: Colors.black),
                                    Text('Continue with Email',
                                        style: TextStyle(
                                            color: Headingtextcolor,
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(width: device_width*0.05,),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ],
                  )),
             Expanded(
                 flex: 4,
                 child:  Container(
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage("assets/images/splash_bg.png"),
                       fit: BoxFit.cover,
                     ),
                   ),
                   child: Center(
                     child: Padding(
                       padding: const EdgeInsets.fromLTRB(18, 0,18, 0),
                       child: Text.rich(
                             TextSpan(
                                 text: 'By continuing you agree to the',
                                 style: CustomTextStyle.conten2(context),
                                 children: <InlineSpan>[
                                   TextSpan(
                                     text: ' Terms of Services',
                                     recognizer: TapGestureRecognizer()
                                       ..onTap = () {
                                         Navigator.push(
                                             context,
                                             MaterialPageRoute(
                                                 builder: (_) => Webview()));
                                       },
                                     style:CustomTextStyle.content2red(context),
                                   ),
                                   TextSpan(
                                     text: ' and acknowledge that you have read our',
                                     style: CustomTextStyle.conten2(context),
                                   ),
                                   TextSpan(
                                     text: ' Privacy Policies',
                                     recognizer: TapGestureRecognizer()
                                       ..onTap = () {
                                         Navigator.push(
                                             context,
                                             MaterialPageRoute(
                                                 builder: (_) => Webview()));
                                       },
                                     style:CustomTextStyle.content2red(context),
                                   ),
                                 ]),
                             textAlign: TextAlign.center,
                             maxLines: 3,
                             softWrap: true,
                           ),
                     ),
                   ),
                 ),),
            ],
          ),
        )));
  }
}
