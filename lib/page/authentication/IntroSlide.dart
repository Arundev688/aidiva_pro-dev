import 'package:aidiva_pro/components/CustomButton.dart';
import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:aidiva_pro/components/customtextstyle.dart';
import 'package:aidiva_pro/page/authentication/IntroSlideItem.dart';
import 'package:aidiva_pro/page/authentication/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroSlide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _slide();
  }
}

class _slide extends State<IntroSlide> {
  int currentPage = 0;
  final splashDelay = 5;

  bool loading = false;
  List<Map<String, String>> splashdata = [
    {
      "heading": "MANAGE APPOINTMENTS",
      "text": "Manage all your appointments, send automated reminders, feedbacks and more...",
      "image": "assets/images/slide1.png"
    },
    {
      "heading": "GET IN TOUCH",
      "text": "Connect  virtually via text, audio or video instantly at your convenience",
      "image": "assets/images/slide2.png"
    },
    {
      "heading": "E-WALLET",
      "text": "Sign in for the cashless transactions on the go",
      "image": "assets/images/slide3.png"
    },
    {
      "heading": "CARE FOR CUSTOMERS",
      "text": "Customer relationship management through aligning marketing, sales and service functions",
      "image": "assets/images/slide4.png"
    },
    {
      "heading": "BUSINESS SUPPORT",
      "text": "Platform for lead management to easily acquire customers and expand business through sales",
      "image": "assets/images/slide5.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double device_width = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;
    return  Material(
      color: Primarycolor,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: splashdata.length,
                      itemBuilder: (context, index) => IntroSlideItem(
                        image: splashdata[index]["image"],
                        heading: splashdata[index]['heading'],
                        text: splashdata[index]['text'],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/splash_bg.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                splashdata.length,
                                    (index) => buildDot(index: index),
                              ),
                            ),
                            Spacer(),
                            CustomButton(
                              enable: true,
                              width: device_width * 0.8,
                              height: device_height * 0.055,
                              text: "Get Started",
                              mystyle: CustomTextStyle.content2white(context),
                              press: () {

                                addBoolToSF("sliderstatus",true);
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) => Register()));
                              },
                            ),
                            SizedBox(height: device_height*0.02),
                            Text('Already have an account?',style: CustomTextStyle.contentred(context)),
                            Spacer(),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            )),
      ),
    );


  }
  addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(microseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: currentPage == index ? 8 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? Primarycolor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}