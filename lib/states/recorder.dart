import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_app/main.dart';
import 'package:medcorder_audio/medcorder_audio.dart';

class Recorder extends State<App> {
  MedcorderAudio audioModule = new MedcorderAudio();
  bool canRecord = true;
  double recordPower = 0.0;
  double recordPosition = 0.0;
  bool isRecording = false;
  bool isPlay = false;
  double playPosition = 0.0;
  String file = "";

  @override
  initState() {
    super.initState();
    audioModule.setCallBack((dynamic data) {
      _onEvent(data);
    });
    _initSettings();
  }

  Future _initSettings() async {
    final String result = await audioModule.checkMicrophonePermissions();
    if (result == 'OK') {
      await audioModule.setAudioSettings();
      setState(() {
        canRecord = true;
      });
    }
    return;
  }

  Future _startRecording() async {
    try {
      DateTime time = new DateTime.now();
      setState(() {
        file = time.millisecondsSinceEpoch.toString();
      });
      final String result = await audioModule.startRecord(file);
      setState(() {
        isRecording = true;
      });
      print('startRecord: ' + result);
    } catch (e) {
      file = "";
      print('startRecord: fail');
    }
  }

  Future _stopRecording() async {
    try {
      final String result = await audioModule.stopRecord();
      print('stopRecord: ' + result);
      setState(() {
        isRecording = false;
      });
    } catch (e) {
      print('stopRecord: fail');
      setState(() {
        isRecording = false;
      });
    }
  }

  Future _startStopPlay() async {
    if (isPlay) {
      await audioModule.stopPlay();
    } else {
      await audioModule.startPlay({
        "file": file,
        "position": 0.0,
      });
    }
  }

  void _onEvent(dynamic event) {
    if (event['code'] == 'recording') {
      double power = event['peakPowerForChannel'];
      setState(() {
        recordPower = (60.0 - power.abs().floor()).abs();
        recordPosition = event['currentTime'];
      });
    }
    if (event['code'] == 'playing') {
      String url = event['url'];
      setState(() {
        playPosition = event['currentTime'];
        isPlay = true;
      });
    }
    if (event['code'] == 'audioPlayerDidFinishPlaying') {
      setState(() {
        playPosition = 0.0;
        isPlay = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: new Center(
          child: canRecord
              ? new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onLongPressStart: (e) => _startRecording(),
                        onLongPressEnd: (e) => _stopRecording(),
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.all(20),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(50),
                              color: Colors.redAccent,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new IconButton(
                                  icon: new Icon(FontAwesomeIcons.play),
                                  onPressed: null,
                                ),
                              ],
                            ))),
                    new Text('recording: ' + recordPosition.toString()),
                    new Text('power: ' + recordPower.toString()),
                    new InkWell(
                      child: new Container(
                        margin: new EdgeInsets.only(top: 40.0),
                        alignment: FractionalOffset.center,
                        child: new Text(isPlay ? 'Stop' : 'Play'),
                        height: 40.0,
                        width: 200.0,
                        color: Colors.redAccent,
                      ),
                      onTap: () {
                        if (!isRecording && file.length > 0) {
                          _startStopPlay();
                        }
                      },
                    ),
                    new Text('playing: ' + playPosition.toString()),
                  ],
                )
              : new Text(
                  'Microphone Access Disabled.\nYou can enable access in Settings',
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
