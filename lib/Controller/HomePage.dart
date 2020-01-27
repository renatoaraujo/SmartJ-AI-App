import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Helper/Colors.dart';
import 'package:mobile_app/Helper/Navigation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('SmartJ'),
            backgroundColor: CustomColors.lightBlack1),
        backgroundColor: CustomColors.lightBlack2,
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.mic, title: "Recorder"),
            TabData(iconData: Icons.camera, title: "Camera"),
          ],
          onTabChangedListener: (position) {
            return Navigation.buildPage(position);
          },
          barBackgroundColor: CustomColors.black0,
          circleColor: CustomColors.schizophreniaRed,
          inactiveIconColor: CustomColors.woolWhite,
        ));
  }
}
