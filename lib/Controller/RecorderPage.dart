import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medcorder_audio/medcorder_audio.dart';
import 'package:mobile_app/Helper/Colors.dart';

class RecorderPage extends StatefulWidget {
  @override
  _RecorderPageState createState() => new _RecorderPageState();
}

class _RecorderPageState extends State<RecorderPage>
    with SingleTickerProviderStateMixin {
  MedcorderAudio audioModule = new MedcorderAudio();
  bool canRecord = true;
  double recordPower = 0.0;
  double recordPosition = 0.0;
  bool isRecording = false;
  bool isPlay = false;
  double playPosition = 0.0;
  String file = "";

  AnimationController _controller;

  @override
  initState() {
    super.initState();
    audioModule.setCallBack((dynamic data) {
      _onEvent(data);
    });
    _controller = new AnimationController(
      vsync: this,
    );
    _initSettings();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  void _stopAnimation() {
    _controller.stop();
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
      _startAnimation();
    } catch (e) {
      file = "";
    }
  }

  Future _stopRecording() async {
    try {
      final String result = await audioModule.stopRecord();
      setState(() {
        isRecording = false;
      });
      _stopAnimation();
    } catch (e) {
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

  // Animation for the ball

  // End animation

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: canRecord
          ? new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CustomPaint(
                  painter: new SpritePainter(_controller),
                  child: GestureDetector(
                    onLongPressStart: (e) => _startRecording(),
                    onLongPressEnd: (e) => _stopRecording(),
                    child: new SizedBox(
                        width: 250.0,
                        height: 250.0,
                        child: new IconButton(
                          color: CustomColors.schizophreniaRed,
                          padding: new EdgeInsets.all(0.0),
                          icon: new Icon(Icons.mic, size: 50.0, color: CustomColors.woolWhite,),
                          onPressed: null,
                        )
                    ),
                  ),
                ),
//                new InkWell(
//                  child: new Container(
//                    margin: new EdgeInsets.only(top: 40.0),
//                    alignment: FractionalOffset.center,
//                    child: new Text(isPlay ? 'Stop' : 'Play'),
//                    height: 40.0,
//                    width: 200.0,
//                    color: CustomColors.schizophreniaRed,
//                  ),
//                  onTap: () {
//                    if (!isRecording && file.length > 0) {
//                      _startStopPlay();
//                    }
//                  },
//                ),
              ],
            )
          : new Text(
              'Microphone Access Disabled.\nYou can enable access in Settings',
              textAlign: TextAlign.center,
            ),
    );
  }
}

class SpritePainter extends CustomPainter {
  final Animation<double> _animation;

  SpritePainter(this._animation) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = new Color.fromRGBO(53, 1, 0, opacity);

    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 2);

    final Paint paint = new Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = new Rect.fromLTRB(0, 0, 250, 250);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}
