import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:mobile_app/Controller/BasePage.dart';
import 'package:mobile_app/Helper/Colors.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.microphone);
  if (permission.toString() != 'PermissionStatus.granted') {
    await PermissionHandler().requestPermissions([
      PermissionGroup.microphone
    ]);
  }

  await FlutterStatusbarcolor.setStatusBarColor(CustomColors.black0);
  await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  await FlutterStatusbarcolor.setNavigationBarColor(CustomColors.black0);
  await FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);

  runApp(new MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: CustomColors.lightBlack3,
    ),
    home: BasePage()
  ));
}
