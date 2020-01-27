import 'package:flutter/material.dart';
import 'package:mobile_app/Controller/HomePage.dart';
import 'package:mobile_app/Controller/Recorder.dart';

class Navigation {
  static Widget buildPage(int selectedPosition) {
    print(selectedPosition.toString());
    if (selectedPosition == 0) {
      HomePage();
    } else if (selectedPosition == 1) {
      RecorderApp();
    } else if (selectedPosition == 2) {
      HomePage();
    }
  }
}

