
import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextStyle {

  //white text styles

  static TextStyle contentwhite(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2.copyWith(
        fontSize: 12.0,
        fontFamily: 'Poppins',
        color: Colors.white70);
  }
  static TextStyle content2white(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2.copyWith(
        fontSize: 13.0,
        fontFamily: 'Poopins-Medium',
        color: Colors.white);
  }

  //prime text style

  static TextStyle heading(BuildContext context){
    return Theme.of(context).textTheme.headline1.copyWith(
      fontSize: 19.0,
      color: Headingtextcolor,
      fontFamily: 'Raleway-Bold',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle contenet(BuildContext context){
    return Theme.of(context).textTheme.bodyText1.copyWith(
      fontSize: 14.0,
      color: Contenttextcolor,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle conten2(BuildContext context){
    return Theme.of(context).textTheme.headline1.copyWith(
      fontSize: 13.0,
      color: Contenttextcolor3,
      fontFamily: 'Poppins-Regular',
        fontWeight: FontWeight.w600
    );
  }

  //red text style

  static TextStyle headingred(BuildContext context){
    return Theme.of(context).textTheme.headline1.copyWith(
      fontSize: 19.0,
      color: Primarycolor,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle subheadingred(BuildContext context){
    return Theme.of(context).textTheme.headline1.copyWith(
      fontSize: 16.0,
      color: Primarycolor,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poopins-Medium',
    );
  }



  static TextStyle contentred(BuildContext context){
    return Theme.of(context).textTheme.headline1.copyWith(
      fontSize: 15.0,
      color: Primarycolor,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle content2red(BuildContext context){
    return Theme.of(context).textTheme.headline1.copyWith(
      fontSize: 13.0,
      color: Primarycolor,
      fontFamily: 'Poppins-Regular',
      fontWeight: FontWeight.w600,


    );
  }


  static TextStyle contenetsixteen(BuildContext context){
    return Theme.of(context).textTheme.bodyText1.copyWith(
      fontSize: 16.0,
      color: Contenttextcolor,
      fontFamily: 'Poopins-Medium',
    );
  }

}
