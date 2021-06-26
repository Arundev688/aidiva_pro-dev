import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aidiva_pro/components/customtextstyle.dart';

class IntroSlideItem extends StatelessWidget {
  const IntroSlideItem({
    Key key,
    this.text,
    this.heading,
    this.image,
  }) : super(key: key);
  final String text, image, heading;

  @override
  Widget build(BuildContext context) {
    double device_width = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          'aidiva pro',style: CustomTextStyle.headingred(context),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Image.asset(
            image,
            height: device_height * 0.22,
            fit: BoxFit.cover,
          ),
        ),
        Spacer(),
        Text(
          heading,
          textAlign: TextAlign.center,
          style: CustomTextStyle.heading(context),
        ),
        SizedBox(height: device_height*0.03),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0,10.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style:CustomTextStyle.contenet(context),
          ),
        ),
      ],
    );
  }
}