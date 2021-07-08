import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:aidiva_pro/components/customtextstyle.dart';
import 'package:aidiva_pro/model/Lookupmodel/LocaldbModel/Countrycode.dart';
import 'package:aidiva_pro/page/Dashboard/dummydata.dart';
import 'package:aidiva_pro/provider/AppointmentsProvider.dart';
import 'package:aidiva_pro/provider/LookupProvider.dart';
import 'package:aidiva_pro/provider/Lookuplocaldb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppointmentsItem.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _home();
  }
}

class _home extends State<Home> {
  String token = "";
  String uuid="";


  @override
  Widget build(BuildContext context) {
    double device_width = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;
    var provider = Provider.of<AppointmentsProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Hello, Dr.john',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Contenttextcolor4,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    )),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: Primarycolor,
                                      size: 22,
                                    ),
                                    DropdownButton(
                                      isExpanded: false,
                                      underline: SizedBox(),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black54,
                                      ),
                                      hint: Text(
                                        'Tiruchirapalli',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Contenttextcolor4,
                                            fontFamily: 'Poppins-Regular'),
                                      ),
                                      onChanged: (val) {
                                        print(val);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              'Manage all your patients here',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Contenttextcolor4,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(height: device_height * 0.01),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  hintText:
                                      'Search patients, health feed, etc.,',
                                  hintStyle: TextStyle(
                                      fontSize: 13.0,
                                      color: Contenttextcolor5,
                                      fontFamily: 'Poppins'),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                      'assets/svg/search.svg',
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[300]),
                                      borderRadius: BorderRadius.circular(25)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[300]),
                                      borderRadius: BorderRadius.circular(25)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25)))),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14, top: 5),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Appointments',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Headingtextcolor,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Text(
                                    'View all',
                                    style: CustomTextStyle.content2red(context),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: device_height * 0.01),
                            Container(
                                width: device_width,
                                height: device_height * 0.11,
                                child: FutureBuilder(
                                  builder: (context, projectSnap) {
                                    if (projectSnap.connectionState ==
                                            ConnectionState.none &&
                                        projectSnap.hasData == null) {
                                      //print('project snapshot data is: ${projectSnap.data}');
                                      return CircularProgressIndicator();
                                    } else {
                                      return provider.appointmentResoponse?.data!=null

                                          ? ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: provider
                                                  .appointmentResoponse
                                                  ?.data
                                                  ?.length,
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (ctx, index) {
                                                return AppoinmentsItem(
                                                  DUMMY_APPOINTMENTS[0]
                                                      .imageurl,
                                                  provider.appointmentResoponse
                                                      .data[index].custName,
                                                  provider.appointmentResoponse
                                                      .data[index].scheduledOn,
                                                  provider
                                                      .appointmentResoponse
                                                      .data[index]
                                                      .scheduledTime,
                                                  provider.appointmentResoponse
                                                      .data[index].onOff,
                                                );
                                              },
                                            )
                                          : Center(child:Text(
                                        ' No Appointments ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontFamily: 'Poppins'),
                                      ));
                                    }
                                  },
                                  future: provider.getappointment(uuid,
                                      token),
                                )),
                            SizedBox(height: device_height * 0.01),
                            Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.add_box_rounded,
                                    color: Primarycolor,
                                    size: 18,
                                  ),
                                  Text(
                                    ('Add Patients'),
                                    style: TextStyle(
                                        color: Primarycolor,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Contenttextcolor4,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 14, bottom: 14, right: 10, left: 10),
                            margin: const EdgeInsets.only(top: 12, bottom: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/profile.png',
                                            height: device_height * 0.07,
                                            width: device_width * 0.07,
                                          ),
                                          Text(
                                            'Profile',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/reach.png',
                                            height: device_height * 0.07,
                                            width: device_width * 0.07,
                                          ),
                                          Text(
                                            'Reach',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/patient _stories.png',
                                            height: device_height * 0.07,
                                            width: device_width * 0.07,
                                          ),
                                          Text(
                                            'Patients stories',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontFamily: 'Poppins'),
                                            softWrap: false,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: device_width,
                                  height: 1,
                                  color: Lightgray4,
                                  margin: const EdgeInsets.only(
                                      left: 5, right: 5, top: 15, bottom: 15),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/consult.png',
                                            height: device_height * 0.07,
                                            width: device_width * 0.07,
                                          ),
                                          Text(
                                            'Consult',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/health_feed.png',
                                            height: device_height * 0.07,
                                            width: device_width * 0.07,
                                          ),
                                          Text(
                                            'Health feeds',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontFamily: 'Poppins'),
                                            softWrap: false,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/report.png',
                                            height: device_height * 0.07,
                                            width: device_width * 0.07,
                                          ),
                                          Text(
                                            'Reports',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Help?',
                              style: TextStyle(
                                  color: Primarycolor,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]);

              default:
                return CircularProgressIndicator();
            }
          }),
    );
  }

  @override
  void initState() {
    final now = DateTime.now();
    // print(new DateTime.now()
    //     .toString()
    //     .substring(0,10)
    getvalue();
    //Provider.of<LookupProvider>(context, listen: false).geterrorResponsedata();
    Lookuplocaldb.db.getErrordata().then((value)
    {
      print(value.length);
    });
    Lookuplocaldb.db.getAllCountrycodedata().then((value)
    {
      print(value.length);
    });

    //final DateFormat formatter = DateFormat('yyyy-MM-dd');
    //final String formatted = formatter.format(now);
    // print(today);
  }

  Future<bool> getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool stringValue = prefs.getBool('bearertoken');
    return stringValue;
  }

  Future<String> getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(key);
    return stringValue;
  }

  getvalue() async {
    token = await getStringValuesSF("bearertoken") ?? false;
    uuid = await getStringValuesSF("uuid") ?? false;
  }
// Future getAppointments() async {
//
//
//  // Provider.of<AppointmentsProvider>(context, listen: false).getappointment("buiopi24", "Bus/59R+2VmCfZ5riyxhYMAr14+S+08sVPeKzSLqVAiU8q1Sd3ijPZ0YpVt8jQSF7eZxY6fVrcrFAyiXr8k8wiaicF9nR6VdYpgW/Vmw+BMKg8eT/8g0hTH+H4PCP4r1DKN4pAwFeseJibOjhmwW5L07POqBQzxOtLkOpW6l/c38OgneoaIHJfM0bFNX+IasxGyXy2jogIp/6+Li7rL8oPNThy6s3+pfYbS1Y6o1wj4fpsWIAgGAiwsWyGhHfTgB:ZmVkY2JhOTg3NjU0MzIxMA==")
//
//   // .then((value) {
//   //
//   //
//   //
//   //   if(value.status=='success') {
//   //
//   //
//   //
//   //
//   //
//   //   }
//
//
//  // }
// //    );
//
//
//
//
// }

}
