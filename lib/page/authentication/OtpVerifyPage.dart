import 'package:aidiva_pro/components/CustomButton.dart';
import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:aidiva_pro/components/customtextstyle.dart';
import 'package:aidiva_pro/model/RegisterResponse.dart';
import 'package:aidiva_pro/page/Dashboard/Homepage.dart';
import 'package:aidiva_pro/provider/AuthenticationProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/customtextstyle.dart';
import 'LoginOptionPage.dart';

class OtpVerifyPage extends StatefulWidget {
  final Data data;
  final String mobileno;

  OtpVerifyPage(this.data, this.mobileno);

  @override
  _OtpVerifyPage createState() => _OtpVerifyPage();
}

class _OtpVerifyPage extends State<OtpVerifyPage> {
  bool loading = false;
  TextEditingController _one = new TextEditingController();
  TextEditingController _two = new TextEditingController();
  TextEditingController _three = new TextEditingController();
  TextEditingController _four = new TextEditingController();
  FocusNode focusNode5;
  FocusNode focusNode6;
  FocusNode focusNode7;
  FocusNode focusNode8;

  @override
  void initState() {
    super.initState();

    focusNode5 = FocusNode();
    focusNode6 = FocusNode();
    focusNode7 = FocusNode();
    focusNode8 = FocusNode();
  }

  @override
  void dispose() {
    focusNode5.dispose();
    focusNode6.dispose();
    focusNode7.dispose();
    focusNode8.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double device_width = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;

    return Material(
        color: Primarycolor,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          body: loading == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
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
                            width: device_width,
                            height: device_height * 0.09,
                            padding: const EdgeInsets.only(left: 15.0),
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
                                  SizedBox(width: device_width * 0.08),
                                ]),
                          ),
                        ),
                      ),
                      SizedBox(height: device_height * 0.015),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Verification Code',
                          style: CustomTextStyle.heading(context),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(13),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: device_width * 0.1,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) {
                                      setState(() {
                                        if (text.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      });
                                    },
                                    textAlignVertical: TextAlignVertical.center,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    focusNode: focusNode5,
                                    autofocus: true,
                                    controller: _one,
                                    style: TextStyle(fontSize: 20.0),
                                    decoration: InputDecoration(
                                      counter: new SizedBox(
                                        height: 0.0,
                                      ),
                                      labelText: '',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: device_width * 0.1,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) {
                                      setState(() {
                                        if (text.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        } else if (text.length == 0) {
                                          FocusScope.of(context)
                                              .previousFocus();
                                        }
                                      });
                                    },
                                    controller: _two,
                                    focusNode: focusNode6,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    style: TextStyle(fontSize: 20.0),
                                    decoration: InputDecoration(
                                      counter: new SizedBox(
                                        height: 0.0,
                                      ),
                                      labelText: '',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: device_width * 0.1,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) {
                                      setState(() {
                                        if (text.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        } else if (text.length == 0) {
                                          FocusScope.of(context)
                                              .previousFocus();
                                        }
                                      });
                                    },
                                    controller: _three,
                                    focusNode: focusNode7,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20.0),
                                    maxLength: 1,
                                    decoration: InputDecoration(
                                      counter: new SizedBox(
                                        height: 0.0,
                                      ),
                                      labelText: '',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: device_width * 0.1,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) {
                                      setState(() {
                                        if (text.length == 1) {
                                          FocusScope.of(context).unfocus();
                                        } else if (text.length == 0) {
                                          FocusScope.of(context)
                                              .previousFocus();
                                        }
                                      });
                                    },
                                    controller: _four,
                                    focusNode: focusNode8,
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.center,
                                    maxLength: 1,
                                    style: TextStyle(fontSize: 20.0),
                                    decoration: InputDecoration(
                                      counter: new SizedBox(
                                        height: 0.0,
                                      ),
                                      labelText: '',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                ),
                              ])),
                      SizedBox(height: device_height * 0.015),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Flexible(
                          child: Text.rich(
                            TextSpan(
                                text: 'Verification code sent to mobile number',
                                style: CustomTextStyle.conten2(context),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: "  " + widget.mobileno,
                                    style: CustomTextStyle.content2red(context),
                                  )
                                ]),
                            maxLines: 2,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: device_height * 0.07),
                      Align(
                        alignment: Alignment.center,
                        child: Text("Resend OTP",
                            style: CustomTextStyle.subheadingred(context),),
                      ),
                      SizedBox(height: device_height * 0.05),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          enable: true,
                          width: device_width * 0.4,
                          height: device_height * 0.06,
                          text: 'Verify',
                          mystyle:
                              TextStyle(color: Colors.white, fontSize: 14.0),
                          press: () {
                            setState(() {
                              loading = true;
                            });
                            String otp = _one.text +
                                _two.text +
                                _three.text +
                                _four.text;
                            verifyotp(
                                otp, widget.data.uuid, widget.data.userType);
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: device_height * 0.29,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/splash_bg.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        )));
  }

  void _showerrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "Authentication ",
          style: TextStyle(color: Colors.blue),
        ),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              // final userProvider = Provider.of<Userprodivider>(context, listen: true);
//              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  void verifyotp(String uuid, String otp, String userType) {
    Provider.of<AuthenticationProvider>(context, listen: false)
        .verifyotp(uuid, otp, userType)
        .then((value) {
      if (value.status == 'success') {
        setState(() {
          loading = false;
        });
        //String ema = email.text;
        addBoolToSF("loginstatus", true);
        addStringToSF("bearertoken", value.data.bearer);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Homepage()),
            (Route<dynamic> route) => false);
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Homepage()));
      } else {
        setState(() {
          loading = false;
        });
        _showerrorDialog(value.message);
        print("failed");
      }
    });
  }

  addStringToSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }
}
