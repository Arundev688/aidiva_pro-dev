import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppoinmentsItem extends StatefulWidget {
  final String image;
  final String name;
  final String date;
  final String time;
  final int online;
  const AppoinmentsItem(
      this.image, this.name, this.date, this.time, this.online);
  @override
  State<StatefulWidget> createState() {
    return new _appointmentItems();
  }
}

class _appointmentItems extends State<AppoinmentsItem> {
  @override
  Widget build(BuildContext context) {
    double device_width = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;

    return  Container(


        margin: const EdgeInsets.only(top: 3, bottom: 3,left: 5, right: 5),
       padding: const EdgeInsets.only(top: 2, bottom: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: device_width*0.02),
            Image.asset(widget.image,
                width: device_width * 0.09, height: device_height * 0.08),
            SizedBox(width: device_width*0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: device_width*0.36,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(widget.date,style: TextStyle(
                        color: Primarycolor,
                        fontFamily:'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),),
                      widget.online==1?CircleAvatar(
                        backgroundColor: Primarycolor,
                        radius: device_width * 0.025,
                        child: Center(
                          child: Icon(Icons.videocam, color: Colors.white,size:15),
                        ),
                      ):SizedBox(),
                    ],
                  ),
                ),
                Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      color: Contenttextcolor4),
                ),
                Text(
                  widget.time,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      color: Contenttextcolor3),
                )
              ],
            )
          ],
        ),
    );
  }
}
