

import 'package:flutter/cupertino.dart';

class APPOINTMENT {
  final String date;
  final String name;
  final String imageurl;
  final IconData video;
  final String time;

  const APPOINTMENT({
    @required this.date,
    @required this.name,
    @required this.video,
    @required this.time,
    @required this.imageurl,
  });
}