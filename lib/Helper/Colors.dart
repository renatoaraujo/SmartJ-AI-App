// Colors based in palette from https://www.colourlovers.com/palette/623761/Walking_Away

import 'package:flutter/material.dart';

class CustomColors {

  static const _blackPrimaryValue = 0xFF000000;
  static const _lightBlack1PrimaryValue = 0xFF111111;
  static const _lightBlack2PrimaryValue = 0xFF222222;
  static const _lightBlack3PrimaryValue = 0xFF333333;
  static const _woolWhitePrimaryValue = 0xFFE8E8E8;
  static const _lightGrayPrimaryValue = 0xFFF6F6F6;
  static const _schizophreniaRedPrimaryValue = 0xFF990100;
  static const _disconnectRedPrimaryValue = 0xFFB90504;

  static const MaterialColor black0 = const MaterialColor(
    _blackPrimaryValue,
    const <int, Color>{
      50: Color.fromRGBO(0, 0, 0, .1),
      100: Color.fromRGBO(0, 0, 0, .2),
      200: Color.fromRGBO(0, 0, 0, .3),
      300: Color.fromRGBO(0, 0, 0, .4),
      400: Color.fromRGBO(0, 0, 0, .5),
      500: Color.fromRGBO(0, 0, 0, .6),
      600: Color.fromRGBO(0, 0, 0, .7),
      700: Color.fromRGBO(0, 0, 0, .8),
      800: Color.fromRGBO(0, 0, 0, .9),
      900: Color.fromRGBO(0, 0, 0, 1),
    },
  );

  static const MaterialColor lightBlack1 = const MaterialColor(
    _lightBlack1PrimaryValue,
    const <int, Color>{
      50: Color.fromRGBO(17, 17, 17, .1),
      100: Color.fromRGBO(17, 17, 17, .2),
      200: Color.fromRGBO(17, 17, 17, .3),
      300: Color.fromRGBO(17, 17, 17, .4),
      400: Color.fromRGBO(17, 17, 17, .5),
      500: Color.fromRGBO(17, 17, 17, .6),
      600: Color.fromRGBO(17, 17, 17, .7),
      700: Color.fromRGBO(17, 17, 17, .8),
      800: Color.fromRGBO(17, 17, 17, .9),
      900: Color.fromRGBO(17, 17, 17, 1),
    },
  );

  static const MaterialColor lightBlack2 = const MaterialColor(
    _lightBlack2PrimaryValue,
    const <int, Color>{
      50: Color.fromRGBO(34, 34, 34, .1),
      100: Color.fromRGBO(34, 34, 34, .2),
      200: Color.fromRGBO(34, 34, 34, .3),
      300: Color.fromRGBO(34, 34, 34, .4),
      400: Color.fromRGBO(34, 34, 34, .5),
      500: Color.fromRGBO(34, 34, 34, .6),
      600: Color.fromRGBO(34, 34, 34, .7),
      700: Color.fromRGBO(34, 34, 34, .8),
      800: Color.fromRGBO(34, 34, 34, .9),
      900: Color.fromRGBO(34, 34, 34, 1),
    },
  );

  static const MaterialColor lightBlack3 = const MaterialColor(
    _lightBlack3PrimaryValue,
    const <int, Color>{
      50: Color.fromRGBO(51, 51, 51, .1),
      100: Color.fromRGBO(51, 51, 51, .2),
      200: Color.fromRGBO(51, 51, 51, .3),
      300: Color.fromRGBO(51, 51, 51, .4),
      400: Color.fromRGBO(51, 51, 51, .5),
      500: Color.fromRGBO(51, 51, 51, .6),
      600: Color.fromRGBO(51, 51, 51, .7),
      700: Color.fromRGBO(51, 51, 51, .8),
      800: Color.fromRGBO(51, 51, 51, .9),
      900: Color.fromRGBO(51, 51, 51, 1),
    },
  );

  static const MaterialColor woolWhite = const MaterialColor(
    _woolWhitePrimaryValue,
    const <int, Color>{
      50: Color.fromRGBO(232, 232, 232, .1),
      100: Color.fromRGBO(232, 232, 232, .2),
      200: Color.fromRGBO(232, 232, 232, .3),
      300: Color.fromRGBO(232, 232, 232, .4),
      400: Color.fromRGBO(232, 232, 232, .5),
      500: Color.fromRGBO(232, 232, 232, .6),
      600: Color.fromRGBO(232, 232, 232, .7),
      700: Color.fromRGBO(232, 232, 232, .8),
      800: Color.fromRGBO(232, 232, 232, .9),
      900: Color.fromRGBO(232, 232, 232, 1),
    },
  );

  static const MaterialColor lightGray = const MaterialColor(
    _lightGrayPrimaryValue,
    const <int, Color>{
      50: Color.fromRGBO(246, 246, 246, .1),
      100: Color.fromRGBO(246, 246, 246, .2),
      200: Color.fromRGBO(246, 246, 246, .3),
      300: Color.fromRGBO(246, 246, 246, .4),
      400: Color.fromRGBO(246, 246, 246, .5),
      500: Color.fromRGBO(246, 246, 246, .6),
      600: Color.fromRGBO(246, 246, 246, .7),
      700: Color.fromRGBO(246, 246, 246, .8),
      800: Color.fromRGBO(246, 246, 246, .9),
      900: Color.fromRGBO(246, 246, 246, 1),
    },
  );

  static const MaterialColor schizophreniaRed = const MaterialColor(
    _schizophreniaRedPrimaryValue,
    const <int, Color>{
      50: Color.fromRGBO(153, 1, 0, .1),
      100: Color.fromRGBO(153, 1, 0, .2),
      200: Color.fromRGBO(153, 1, 0, .3),
      300: Color.fromRGBO(153, 1, 0, .4),
      400: Color.fromRGBO(153, 1, 0, .5),
      500: Color.fromRGBO(153, 1, 0, .6),
      600: Color.fromRGBO(153, 1, 0, .7),
      700: Color.fromRGBO(153, 1, 0, .8),
      800: Color.fromRGBO(153, 1, 0, .9),
      900: Color.fromRGBO(153, 1, 0, 1),
    },
  );

  static const MaterialColor disconnectRed = const MaterialColor(
    _disconnectRedPrimaryValue,
    const <int, Color>{
      50: Color.fromRGBO(185, 5, 4, .1),
      100: Color.fromRGBO(185, 5, 4, .2),
      200: Color.fromRGBO(185, 5, 4, .3),
      300: Color.fromRGBO(185, 5, 4, .4),
      400: Color.fromRGBO(185, 5, 4, .5),
      500: Color.fromRGBO(185, 5, 4, .6),
      600: Color.fromRGBO(185, 5, 4, .7),
      700: Color.fromRGBO(185, 5, 4, .8),
      800: Color.fromRGBO(185, 5, 4, .9),
      900: Color.fromRGBO(185, 5, 4, 1),
    },
  );
}

