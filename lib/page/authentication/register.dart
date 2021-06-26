import 'dart:convert';

import 'package:aidiva_pro/components/CustomButton.dart';
import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:aidiva_pro/components/customtextstyle.dart';
import 'package:aidiva_pro/model/CountryData.dart';
import 'package:aidiva_pro/model/Lookupmodel/ErrorResponse.dart';
import 'package:aidiva_pro/page/authentication/IntroSlide.dart';
import 'package:aidiva_pro/page/authentication/LoginMobilePage.dart';
import 'package:aidiva_pro/page/authentication/LoginOptionPage.dart';
import 'package:aidiva_pro/page/otherpages/Weview.dart';
import 'package:aidiva_pro/provider/AuthenticationProvider.dart';
import 'package:aidiva_pro/provider/LookupProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../components/customtextstyle.dart';
import '../../components/customtextstyle.dart';
import 'OtpVerifyPage.dart';
import 'SelectCountry.dart';

class Register extends StatefulWidget {
  @override
  _register createState() => _register();
}

class _register extends State<Register> {
  bool showpassword = false;
  FocusNode focusNode1;
  FocusNode focusNode2;
  FocusNode focusNode3;
  GlobalKey<FormState> _registerkey = GlobalKey<FormState>();
  bool loading = false;
  int mobilelength;
  String country = "+91";
  TextEditingController mobile = new TextEditingController();
  TextEditingController countrycontroller = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  bool isChecked = false;

  @override
  void initState() {
    super.initState();

    Provider.of<LookupProvider>(context, listen: false).getcountry();
    Provider.of<LookupProvider>(context, listen: false).getcountrylength();

    Provider.of<AuthenticationProvider>(context, listen: false)
        .getcurrentcountrycode()
        .then((value) {
      if (value != null) {
        String countrycode =
            value.countryCallingCode.replaceAll(new RegExp(r'[^\w\s]+'), '');

        print("countrycode" + countrycode);

        for (int i = 0;
            i <
                Provider.of<LookupProvider>(context, listen: false)
                    .countryLookupResponse
                    .data
                    .length;
            i++) {
          if (Provider.of<LookupProvider>(context, listen: false)
                  .countryLookupResponse
                  .data[i]
                  .mastLookupKey ==
              countrycode) {
            String key = Provider.of<LookupProvider>(context, listen: false)
                .countryLookupResponse
                .data[i]
                .mastLookupKey;

            setState(() {
              country = "+" + key;
            });

            for (int j = 0;
                j <
                    Provider.of<LookupProvider>(context, listen: false)
                        .countryCodeLengthResponse
                        .data
                        .length;
                j++) {
              if (key ==
                  Provider.of<LookupProvider>(context, listen: false)
                      .countryCodeLengthResponse
                      .data[j]
                      .mastLookupKey)
                mobilelength = int.parse(
                    Provider.of<LookupProvider>(context, listen: false)
                        .countryCodeLengthResponse
                        .data[j]
                        .mastLookupValue);
            }
          }
        }
      }
    });
    showpassword = false;
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    countrycontroller.text = country;
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double device_width = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;
    var provider = Provider.of<LookupProvider>(context, listen: false);

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
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child:  InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        LoginOptionPage()));
                                          },
                                          child: Text(
                                            'Login',
                                            style:
                                            CustomTextStyle.content2white(
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
                              )
                            ),
                          )),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Register',
                        style: CustomTextStyle.heading(context),
                      ),
                    ),
                    SizedBox(height: device_height * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Form(
                          key: _registerkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   InkWell(
//                                       onTap: () {
//                                         Navigator.of(context)
//                                             .push(new MaterialPageRoute<
//                                                     CountryData>(
//                                                 builder: (_) =>
//                                                     SelectCountry()))
//                                             .then((CountryData value) {
//                                           setState(() {
//                                             for (int j = 0;
//                                                 j <
//                                                     Provider.of<LookupProvider>(
//                                                             context,
//                                                             listen: false)
//                                                         .countryCodeLengthResponse
//                                                         .data
//                                                         .length;
//                                                 j++) {
//                                               if (value.id ==
//                                                   Provider.of<LookupProvider>(
//                                                           context,
//                                                           listen: false)
//                                                       .countryCodeLengthResponse
//                                                       .data[j]
//                                                       .mastLookupKey)
//                                                 mobilelength = int.parse(Provider
//                                                         .of<LookupProvider>(
//                                                             context,
//                                                             listen: false)
//                                                     .countryCodeLengthResponse
//                                                     .data[j]
//                                                     .mastLookupValue);
//                                             }
//                                             country = "+" + value.id;
//                                           });
//                                         });
//                                       },
//                                       child: Container(
//                                           width: device_width * 0.2,
//                                           height: device_height*0.06,
//                                          child: DropdownButton(
//                                             hint: Text(country),
//                                             icon: Icon(Icons
//                                                 .keyboard_arrow_down_rounded),
//                                             underline: Container(
//                                               height: 1.0,
//                                               decoration: const BoxDecoration(
//                                                 border: Border(
//                                                   bottom: BorderSide(
//                                                     color: Colors.black38,
//                                                     width: 0,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ))),
//                                   SizedBox(width: device_width * 0.02),
//                                   Align(
//                                     alignment: Alignment.topCenter,
//                                     child:Container(
//                                     width: device_width * 0.66,
//                                     child: TextFormField(
//                                       focusNode: focusNode1,
//                                       controller: mobile,
//                                       autofocus: true,
//                                       autovalidateMode:
//                                           AutovalidateMode.onUserInteraction,
//                                       keyboardType: TextInputType.number,
//                                       textInputAction: TextInputAction.next,
//                                       validator: (value) {
//                                         // if (value.length > 9 && value.length < 9) {
//                                         //   return "Enter 9 Digit MobileNumber";
//                                         // }
//                                         return validateMobile(value);
//                                         return null;
//                                       },
//                                       decoration: InputDecoration(
//                                         labelText: 'Enter your mobile number',
//                                         floatingLabelBehavior:
//                                             FloatingLabelBehavior.never,
//                                         helperText: '',
//                                       ),
//                                     ),
//
// //                                     TextFormField(
// // //                                       controller: mobile,
// // //                                       autofocus: true,
// // //                                       focusNode: focusNode1,
// // //                                       autovalidateMode:
// // //                                           AutovalidateMode.onUserInteraction,
// // //                                       keyboardType: TextInputType.number,
// // //                                       textInputAction: TextInputAction.next,
// // //                                       //   autovalidate: true,
// // //                                       validator: (value) {
// // // //                                if (value.length > 9 && value.length < 9) {
// // // //                                  return "Enter 9 Digit MobileNumber";
// // // //                                }
// // //                                         return validateMobile(value);
// // //                                         return null;
// // //                                       },
// // //                                       decoration: InputDecoration(
// // //                                         labelText: 'Enter your mobile number',
// // //                                         floatingLabelBehavior:
// // //                                             FloatingLabelBehavior.never,
// // //                                       ),
// // //                                     ),
//                                   ))
//                                 ],
//                               ),

                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        width: device_width * 0.20,
                                        child: TextFormField(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(new MaterialPageRoute<
                                                        CountryData>(
                                                    builder: (_) =>
                                                        SelectCountry()))
                                                .then((CountryData value) {
                                              setState(() {
                                                for (int j = 0;
                                                    j <
                                                        Provider.of<LookupProvider>(
                                                                context,
                                                                listen: false)
                                                            .countryCodeLengthResponse
                                                            .data
                                                            .length;
                                                    j++) {
                                                  if (value.id ==
                                                      Provider.of<LookupProvider>(
                                                              context,
                                                              listen: false)
                                                          .countryCodeLengthResponse
                                                          .data[j]
                                                          .mastLookupKey)
                                                    mobilelength = int.parse(Provider
                                                            .of<LookupProvider>(
                                                                context,
                                                                listen: false)
                                                        .countryCodeLengthResponse
                                                        .data[j]
                                                        .mastLookupValue);
                                                }
                                                country = "+" + value.id;
                                                countrycontroller.text =
                                                    country;
                                              });
                                            });
                                          },
                                          controller: countrycontroller,
                                          keyboardType: TextInputType.number,
                                          readOnly: true,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            contentPadding: new EdgeInsets.only(
                                                bottom: 2.0),
                                            labelText: '',
                                            suffixIcon: IconButton(
                                              splashColor: Colors.transparent,
                                              icon: Icon(Icons
                                                  .keyboard_arrow_down_rounded),
                                              onPressed: () {},
                                            ),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            helperText: '',
                                          ),
                                        )
                                        // DropdownButton(
                                        //
                                        //   isExpanded: true,
                                        //
                                        //   hint: Center(child:Text(country,textAlign: TextAlign.center,)),
                                        //   icon: Icon(Icons
                                        //       .keyboard_arrow_down_rounded),
                                        //   underline: Container(
                                        //     height: 1.0,
                                        //     decoration: const BoxDecoration(
                                        //       border: Border(
                                        //         bottom: BorderSide(
                                        //           color: Colors.black38,
                                        //           width: 1,
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // )

                                        ),
                                  ),
                                  SizedBox(width: device_width * 0.03),
                                  Expanded(
                                      flex: 7,
                                      child: Container(
                                        width: device_width * 0.64,
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller: mobile,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            return validateMobile(value);
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: new EdgeInsets.only(
                                                bottom: 2.0),
                                            labelText:
                                                'Enter your mobile number',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            helperText: '',
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                              TextFormField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                //   autovalidate: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    labelText: 'Enter your email id',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    helperText: ''),
                                validator: (value) {
                                  return validateEmail(value);
                                },
                              ),
                              TextFormField(
                                controller: pass,
                                //autovalidate: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                obscureText: !showpassword,
                                validator: (value) {
                                  if (value.length == 0) {
                                    return "Enter Your Password";
                                  } else if (value.length < 5) {
                                    return "Password should be atleast 5 and above";
                                  } else {
                                    return null;
                                  }
                                },
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  labelText: 'Create a password',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  helperText: '',
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
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: device_height * 0.01),
                    Row(
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
                    SizedBox(height: device_height * 0.02),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                          enable: isChecked,
                          width: device_width * 0.5,
                          height: device_height * 0.06,
                          text: 'Continue',
                          mystyle: TextStyle(
                              color: isChecked ? Colors.white : Colors.black12,
                              fontSize: 14.0),
                          press: () {
                            if (isChecked) {
                              final isValid =
                                  _registerkey.currentState.validate();
                              if (isValid) {
                                setState(() {
                                  loading = true;
                                  register(country, mobile.text, email.text,
                                      pass.text, provider);
                                });
                              }
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder: (BuildContext context) => OtpVerifyPage()));
                            }
                          }),
                    ),
                    Container(
                        height: device_height * 0.25,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/splash_bg.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                  ],
                )),
        ),
      ),
    );
  }

  void register(String countrycode, String mobileno, String email,
      String password, LookupProvider provider) {
    Provider.of<AuthenticationProvider>(context, listen: false)
        .register(countrycode, mobileno, email, password)
        .then((value) {
      if (value.status == 'success') {
        loading = false;
        //String ema = email.text;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => OtpVerifyPage(value.data, mobileno)));
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
        } else if (value.message == 'err_accountAlreadyExists') {
          messages = "Your Account Already Exists";
        } else if (value.message == 'err_mobileTaken') {
          messages = "Your Mobile Number Already Taken";
        } else {
          messages = value.message;
        }
        _showerrorDialog(messages);
        print("failed");
      }
    });
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }

  String validateMobile(String value) {
    // String pattern = r'(^(?:[+0]9)?[0-9]{9}$)';
    //RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (value.length < mobilelength) {
      return 'Mobile number not valid';
    } else if (value.length > mobilelength) {
      return 'Mobile number Must be $mobilelength digit';
    }
    // else if (!regExp.hasMatch(value)) {
    //   return 'Please enter valid mobile number';
    // }
    return null;
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
