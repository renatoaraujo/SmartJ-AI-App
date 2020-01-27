import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Controller/HomePage.dart';
import 'package:mobile_app/Controller/RecorderPage.dart';
import 'package:mobile_app/Helper/Colors.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('SmartJ'),
            backgroundColor: CustomColors.black0),
        backgroundColor: CustomColors.lightBlack1,
        body: _getPage(currentPage),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.mic, title: "Recorder"),
          ],
          onTabChangedListener: (position) {
            _setPage(position);
          },
          barBackgroundColor: CustomColors.black0,
          circleColor: CustomColors.schizophreniaRed,
          inactiveIconColor: CustomColors.woolWhite,
        )
    );
  }

  void _setPage(int position) {
    setState(() {
      currentPage = position;
    });
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return new HomePage();
      case 1:
        return new RecorderPage();
      default:
        return new HomePage();
    }
  }
}
