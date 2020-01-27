import 'package:flutter/material.dart';
import 'package:mobile_app/Helper/Colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        'Nothing yet',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: CustomColors.woolWhite),
      ),
    );
  }
}
