

import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function press;
  final TextStyle mystyle;
  final double width;
  final double height;
  final bool enable;

  const CustomButton({
    Key key,
    this.text,
    this.press,
    this.mystyle,
    this.height,
    this.width,this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: enable?Primarycolor:Color(0xFFd6d5d5),
        onPressed:  press,

        child: Text(
          text,
          style: mystyle,
        ),
      ),
    );
  }
}
