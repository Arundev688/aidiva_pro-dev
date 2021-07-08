import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:aidiva_pro/page/Dashboard/Home.dart';
import 'package:aidiva_pro/page/Dashboard/Homepage.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';

import 'NavDrawer.dart';

class Dasboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _dashboard();
  }
}

class _dashboard extends State<Dasboard> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double devicewidth = MediaQuery.of(context).size.width;
    double deviceheight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: NavDrawer(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Primarycolor,
        centerTitle: true,
        title: Container(
          width: devicewidth*0.124,
          child: Stack(
            children: [
              Image.asset('assets/images/logo_mini.png',color: Colors.white,width: devicewidth*0.07,height: deviceheight*0.06,),
              // Positioned(
              //     bottom: 0,
              //     right: 0,
              //     child: Icon(Icons.keyboard_arrow_down,color: Colors.white70))
            ],
          ),
        ),
        actions: [
            CircleAvatar(
              radius: devicewidth*0.055,
              backgroundColor: PrimaryDark,
              child: Center(
                child: SvgPicture.asset('assets/svg/notification1.svg'),
              ),
            ),
          SizedBox(width: devicewidth*0.03),
          Image.asset('assets/images/user.png',width: devicewidth*0.09,height: deviceheight*0.07,),
          SizedBox(width: devicewidth*0.03),
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Home(),
            Container(color: Colors.white,),
            Homepage(),
            Container(color: Colors.white,),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
              icon: SvgPicture.asset('assets/svg/home.svg',color: Primarycolor,)
          ),
          BottomNavyBarItem(
              title: Text('Summary'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
              icon:SvgPicture.asset('assets/svg/patients.svg',color: Primarycolor)
          ),
          BottomNavyBarItem(
              title: Text('Settings'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
              icon: SvgPicture.asset('assets/svg/settings.svg',color: Primarycolor)
          ),
          BottomNavyBarItem(
              title: Text('Notification'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
              icon: SvgPicture.asset('assets/svg/notification.svg',color: Primarycolor)
          ),
        ],
      ),
    );
  }
}
