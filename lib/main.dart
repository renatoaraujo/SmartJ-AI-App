import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:mobile_app/Controller/HomePage.dart';
import 'package:mobile_app/Controller/Recorder.dart';
import 'package:mobile_app/Helper/Colors.dart';

void main() {
  runApp(new MaterialApp(
    home: HomePage(),
    routes: <String, WidgetBuilder>{
      "/recorder" : (BuildContext context)=> new RecorderApp(),
      //add more routes here
    },
  ));

  FlutterStatusbarcolor.setStatusBarColor(CustomColors.black0);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  FlutterStatusbarcolor.setNavigationBarColor(CustomColors.black0);
  FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
}
