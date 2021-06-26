import 'dart:convert';
import 'dart:io';

import 'package:aidiva_pro/components/CustomButton.dart';
import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:aidiva_pro/components/customtextstyle.dart';
import 'package:aidiva_pro/model/Lookupmodel/ErrorResponse.dart';
import 'package:aidiva_pro/page/Dashboard/Homepage.dart';
import 'package:aidiva_pro/page/authentication/register.dart';
import 'package:aidiva_pro/page/otherpages/Weview.dart';
import 'package:aidiva_pro/provider/AuthenticationProvider.dart';
import 'package:aidiva_pro/provider/LookupProvider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/customtextstyle.dart';

class LoginEmailPage extends StatefulWidget {
  @override
  _LoginEmailPage createState() => _LoginEmailPage();
}

class _LoginEmailPage extends State<LoginEmailPage> {
  bool showpassword = false;
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController mailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  RegExp regExp;
  FocusNode focusNode1;
  FocusNode focusNode2;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    showpassword = false;
    loading = false;
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double device_width = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;
    var provider = Provider.of<LookupProvider>(context, listen: false);

    Pattern pattern =
        (r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    regExp = new RegExp(pattern);

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
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: device_height * 0.25,
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
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15),
                                  child:Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child:InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          Register()));
                                            },
                                            child: Text(
                                              'Sign up',
                                              style: CustomTextStyle
                                                  .content2white(context),
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
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Login',
                            style: CustomTextStyle.heading(context),
                          ),
                        ),
                        SizedBox(height: device_height * 0.03),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    autofocus: true,
                                    focusNode: focusNode1,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    controller: mailcontroller,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      labelText: 'Enter your Mail',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Mail';
                                      } else if (!(value.contains(regExp))) {
                                        return 'enter valid mail';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: device_height * 0.03),
                                  TextFormField(
                                    autofocus: true,
                                    focusNode: focusNode2,
                                    obscureText: !showpassword,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    controller: passwordcontroller,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      isDense: true,
                                      labelText: 'Enter your Password',
                                      suffixIcon: IconButton(
                                        splashColor: Colors.transparent,
                                        icon: Icon(
                                          showpassword
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            showpassword = !showpassword;
                                          });
                                        },
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Password';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: device_height * 0.03),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Forget password?',
                                      style:CustomTextStyle.conten2(context),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: device_height * 0.02),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          value: isChecked,
                                          onChanged: (bool value) {
                                            setState(() {
                                              isChecked = value;
                                            });
                                          },
                                        ),
                                        Flexible(
                                          child: Text.rich(
                                            TextSpan(
                                                text: 'By signup, I accept the ',
                                                style: CustomTextStyle.conten2(context),
                                                children: <InlineSpan>[
                                                  TextSpan(
                                                    text: 'Terms and conditions',
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (_) => Webview()));
                                                      },
                                                    style:CustomTextStyle.content2red(context),
                                                  )
                                                ]),
                                            maxLines: 2,
                                            softWrap: true,
                                          ),
                                        ),
                                        // Expanded(child:Column(
                                        //   mainAxisAlignment: MainAxisAlignment.center,
                                        //
                                        //   children: [
                                        //
                                        //
                                        //
                                        //
                                        //
                                        //
                                        //
                                        //
                                        //
                                        //
                                        //
                                        //
                                        //     InkWell(
                                        //       onTap: ()
                                        //       {
                                        //         Navigator.push(
                                        //             context,
                                        //             MaterialPageRoute(
                                        //                 builder: (_) => Webview()));
                                        //       },
                                        //       child:Text("Terms and conditions ",
                                        //           style: TextStyle(color: Colors.red)) ,
                                        //
                                        //     )
                                        //
                                        //
                                        //   ],
                                        // ))
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(height: device_height * 0.05),
                        loading
                            ? Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator()))
                            : Align(
                                alignment: Alignment.center,
                                child: CustomButton(
                                  enable: isChecked,
                                  width: device_width * 0.4,
                                  height: device_height * 0.06,
                                  text: 'Submit',
                                  mystyle: TextStyle(
                                      color: isChecked
                                          ? Colors.white
                                          : Colors.black12,
                                      fontSize: 14.0),
                                  press: () {
                                    if (isChecked) {
                                      if (_formKey.currentState.validate()) {
                                        setState(() {
                                          loading = true;
                                        });
                                        _getLogin(provider);
                                      }
                                    }
                                  },
                                ),
                              ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: device_height * 0.3,
                            width: device_width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/splash_bg.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ));
  }

  void _getLogin(LookupProvider provider) {
    Provider.of<AuthenticationProvider>(context, listen: false)
        .getuserlogin(mailcontroller.text, passwordcontroller.text)
        .then((value) {
      if (value.status == 'success') {

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Homepage()));
        setState(() {
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
        String gg = errorResponseToJson(provider.errorResponse);
        Map<String, dynamic> jsonResponse = json.decode(gg);
        String messages = "";
        if (jsonResponse.containsKey(value.message)) {
          // do your work
          messages = jsonResponse[value.message];
        } else if (value.message == 'err_incorrectPassword') {
          messages = "You Entered Incorrect Password";
        }else if(value.message=='err_emailNotRegistered')
          {
            messages="Your Email Address not Registered";
          }

        else {
          messages = value.message;
        }

        _showerrorDialog(messages);
        print("failed");
        print(value.message);
      }
    });
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
}
