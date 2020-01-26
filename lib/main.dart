import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/states/recorder.dart';

void main() {
  runApp(new App());
}

class App extends StatefulWidget {
  @override
  Recorder createState() => new Recorder();
}
