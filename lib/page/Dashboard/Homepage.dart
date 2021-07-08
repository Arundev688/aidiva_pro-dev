import 'package:aidiva_pro/components/CustomButton.dart';
import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:aidiva_pro/main.dart';
import 'package:aidiva_pro/page/authentication/LoginOptionPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Center(child: Text("HomePage")),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        enable: true,
                        width: device_width * 0.4,
                        height: device_height * 0.06,
                        text: 'Logout',
                        mystyle:
                        TextStyle(color: Colors.white, fontSize: 14.0),
                        press: () {
                          showGeneralDialog(
                            barrierDismissible: false,
                            context: context,
                            barrierColor: Colors.black54,
                            // space around dialog
                            transitionDuration:
                            Duration(milliseconds: 20),
                            transitionBuilder:
                                (context, a1, a2, child) {
                              return ScaleTransition(
                                  scale: CurvedAnimation(
                                      parent: a1,
                                      curve: Curves.elasticOut,
                                      reverseCurve:
                                      Curves.easeOutCubic),
                                  child:
                                  _buildDialogContent(context));
                            },
                            pageBuilder: (BuildContext context,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ))));
  }

  Widget _buildDialogContent(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: mywidth * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.only(
            top: myheight * 0.02,
            left: mywidth * 0.05,
            right: mywidth * 0.05,
            bottom: myheight * 0.01), // spacing inside the box
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: mywidth * 0.05,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.logout,
                color: Colors.black,
                size: myheight * 0.04,
              ),
            ),
            SizedBox(height: myheight * 0.03),
            Text(
              'Logout Alert',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'font/Nunito-Black.ttf',
                  decoration: TextDecoration.none),
            ),
            SizedBox(height: myheight * 0.03),
            Text(
              'Do you want to logout our application?',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'font/Nunito-Regular.ttf',
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: myheight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  enable: true,
                  width: mywidth * 0.32,
                  height: myheight * 0.055,
                  press: () {
                    addStringToSF();
                    // Navigator.of(context).pop();
                  },
                  text: 'Yes',
                  mystyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontFamily: 'font/Nunito-Regular.ttf'),
                ),
                CustomButton(
                  enable: true,
                  width: mywidth * 0.32,
                  height: myheight * 0.06,
                  press: () {
                    Navigator.of(context).pop();
                  },
                  text: 'No',
                  mystyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontFamily: 'font/Nunito-Regular.ttf'),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("loginstatus", false);
    prefs.setString("bearertoken", "");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginOptionPage()));
  }
}
