import 'dart:async';
import 'dart:io';

import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:aidiva_pro/page/Dashboard/Dashboard.dart';
import 'package:aidiva_pro/page/Dashboard/Homepage.dart';
import 'package:aidiva_pro/page/authentication/IntroSlide.dart';
import 'package:aidiva_pro/page/authentication/register.dart';
import 'package:aidiva_pro/provider/AppointmentsProvider.dart';
import 'package:aidiva_pro/provider/AuthenticationProvider.dart';
import 'package:aidiva_pro/provider/LookupProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/customtextstyle.dart';

void main(){

  HttpOverrides.global = new MyHttpOverrides();
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
  ), ChangeNotifierProvider(
      create: (context) => AppointmentsProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LookupProvider(),
    )
  ],child:MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black,
        )
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool loginstatus=false;
  String bearertoken="";

  bool slidestatus=false;

  @override
  void initState() {
    super.initState();
    Provider.of<LookupProvider>(context, listen: false).geterrorResponsedata();
     Provider.of<LookupProvider>(context, listen: false).getcountry();
    Provider.of<LookupProvider>(context, listen: false).getcountrylength();
    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    double device_width = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;

    return Material(
      color: Primarycolor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Primarylight,
          body: Column(
            children: [
              Expanded(
                  child: Image.asset(
                    'assets/images/logo.png',
                    color: Colors.white,
                    width: device_width * 0.18,
                    height: device_height * 0.13,
                  )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo2.png',
                      width: device_width * 0.45,
                      height: device_height * 0.06,
                    ),
                    SizedBox(height: device_height * 0.03),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Text(
                        'A Complete Health  and Wellness Solution Provided in one App',
                        style: CustomTextStyle.contentwhite(context),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: device_width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/splash_bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Spacer(flex: 3,),
                      Text(
                          'ISO 27001 Certified Online Healthcare Platform',
                          style: CustomTextStyle.contentwhite(context)),
                      Spacer(),
                    ],

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getdata() async
  {
    loginstatus = await getBoolValuesSF() ?? false;

    slidestatus = await getBoolValuesSlideStausSF() ?? false;
    bearertoken=await getStringValuesSF()?? "";

    print(loginstatus);
    print(slidestatus);
    print(bearertoken);
    _loadpage();
    }
  Future<bool> getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('loginstatus');
  } Future<bool> getBoolValuesSlideStausSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('sliderstatus');
  }
  Future<String> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('bearertoken');
  }

   _loadpage() async {
     if (loginstatus==true) {
       return Timer(Duration(seconds: 4), navigationDashboardPage);
     }else {
       if(slidestatus==true)
         {
           return Timer(Duration(seconds: 4), navigationLoginPage);
         }else{
         return Timer(Duration(seconds: 4), navigationIntroSlide);
       }
     }
   }
  void navigationIntroSlide() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => IntroSlide()));
  }
  void navigationLoginPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Register()));
  }
  void navigationDashboardPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Dasboard()));
  }


}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}