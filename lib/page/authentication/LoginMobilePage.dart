import 'dart:convert';

import 'package:aidiva_pro/components/CustomButton.dart';
import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:aidiva_pro/components/customtextstyle.dart';
import 'package:aidiva_pro/model/CountryData.dart';
import 'package:aidiva_pro/model/Lookupmodel/ErrorResponse.dart';
import 'package:aidiva_pro/page/authentication/register.dart';
import 'package:aidiva_pro/page/otherpages/Weview.dart';
import 'package:aidiva_pro/provider/AuthenticationProvider.dart';
import 'package:aidiva_pro/provider/LookupProvider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'OtpVerifyPage.dart';
import 'SelectCountry.dart';

class LoginMobilePage extends StatefulWidget {
  @override
  _LoginMobilePage createState() => _LoginMobilePage();
}

class _LoginMobilePage extends State<LoginMobilePage> {
  bool loading = false;
  GlobalKey<FormState> _mobilekey = GlobalKey<FormState>();
  TextEditingController mobile = new TextEditingController();
  TextEditingController countrycontroller = new TextEditingController();
  FocusNode focusNode1;
  bool isChecked = false;

  String country = "+91";
  int mobilelength;

  bool countryloading=true;

  @override
  void initState() {
    super.initState();

    Provider.of<LookupProvider>(context, listen: false).getcountry();
    Provider.of<LookupProvider>(context, listen: false).getcountrylength();

    Provider.of<AuthenticationProvider>(context, listen: false)
        .getcurrentcountrycode()
        .then((value) {
setState(()
{
  countryloading=false;
});
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

            country = "+" + key;
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
    focusNode1 = FocusNode();
    countrycontroller.text = country;
  }

  @override
  void dispose() {
    focusNode1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double device_width = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;
    var provider = Provider.of<LookupProvider>(context, listen: false);

    // TODO: implement build
    return Material(
        color: Primarycolor,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          body: countryloading==true ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ):SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Form(
                            key: _mobilekey,
                            child: Column(children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          width: device_width * 0.2,
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
                                              contentPadding:
                                                  new EdgeInsets.only(
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
                                          ))),
                                  SizedBox(width: device_width * 0.03),
                                  Expanded(
                                      flex: 7,
                                      child: Container(
                                        width: device_width * 0.64,
                                        child: TextFormField(
                                          focusNode: focusNode1,
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
                            ])),
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
                                  text: 'By signingup, I accept the ',
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
                                      style:
                                          CustomTextStyle.content2red(context),
                                    )
                                  ]),
                              maxLines: 2,
                              softWrap: true,
                              textAlign: TextAlign.center,
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
                      SizedBox(height: device_height * 0.1),
                      Align(
                        alignment: Alignment.center,
                        child: loading == true
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: CircularProgressIndicator(),
                            )
                          ],
                        )
                            :CustomButton(
                            enable: isChecked,
                            width: device_width * 0.4,
                            height: device_height * 0.06,
                            text: 'Continue',
                            mystyle: TextStyle(
                                color:
                                    isChecked ? Colors.white : Colors.black12,
                                fontSize: 14.0),
                            press: () {
                              if (isChecked) {
                                final isValid =
                                    _mobilekey.currentState.validate();
                                if (isValid) {
                                  setState(() {
                                    loading = true;
                                    loginwithmobile(mobile.text, provider);
                                  });
                                }
                              }
                            }),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: device_height * 0.32,
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

  void loginwithmobile(String mobileno, LookupProvider provider) {
    Provider.of<AuthenticationProvider>(context, listen: false)
        .loginwithmobile(mobileno)
        .then((value) {
      if (value.status == 'success') {
        //String ema = email.text;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => OtpVerifyPage(value.data, mobileno)));
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
        }else if(value.message=="err_sendingOTP")
          {
            messages = "OTP sending Failed";
          }else
            {
              messages=value.message;
            }
        _showerrorDialog(messages);
        print("failed");
      }
    });
  }

  void _showerrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text(
//           "Authentication ",
//           style: TextStyle(color: Colors.blue),
//         ),
//         content: Text(message),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('Ok'),
//             onPressed: () {
//               // final userProvider = Provider.of<Userprodivider>(context, listen: true);
// //              Navigator.of(context).pop();
//               Navigator.of(context).pop();
//             },
//           )
//         ],
//       ),
//     );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message,style: TextStyle(color:Colors.white,)),
      backgroundColor: Colors.orange,
    ));
  }
}
