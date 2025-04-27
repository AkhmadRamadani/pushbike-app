import 'package:flutter/material.dart';

abstract class ColorConst {
  static const gradientCard = LinearGradient(colors: [
    Color(0xfff9c823),
    Color(0xfffaa03c),
    Color(0xfffb7855),
    Color(0xfffc506e)
  ]);

  static const Color blue100 = Color(0xff3f71d2);

  static const Color blue90 = Color(0xff78afe0);

  static const Color blue80 = Color(0xff87b8e4);

  static const Color blue70 = Color(0xff96c1e7);

  static const Color blue60 = Color(0xffa5caeb);

  static const Color blue50 = Color(0xffb4d2ee);

  static const Color blue40 = Color(0xffc3dbf1);

  static const Color blue30 = Color(0xffd2e4f5);

  static const Color blue20 = Color(0xffe1edf8);

  static const Color blue10 = Color(0xfff0f6fc);

  static const Color green100 = Color(0xffa4e89d);

  static const Color green90 = Color(0xffadeaa7);

  static const Color green80 = Color(0xffb6edb1);

  static const Color green70 = Color(0xffbfefba);

  static const Color green60 = Color(0xffc8f1c4);

  static const Color green50 = Color(0xffd1f3ce);

  static const Color green40 = Color(0xffdbf6d8);

  static const Color green30 = Color(0xffe4f8e2);

  static const Color green20 = Color(0xffedfaeb);

  static const Color green10 = Color(0xfff6fdf5);

  static const Color dangerBorder = Color(0xffe55459);

  static const Color dangerSurface = Color(0xfffa8f8d);

  static const Color dangerMain = Color(0xffdd2127);

  static const Color successBorder = Color(0xff49b68d);

  static const Color successSurface = Color(0xffa2d7c3);

  static const Color successMain = Color(0xff018554);

  static const gradientGreen = LinearGradient(
    colors: [
      Color(0xff69a6dd),
      Color(0xffa4e89d),
    ],
  );

  static const gradientYellow = LinearGradient(
    colors: [
      Color(0xfffcf3e3),
      Color(0xfff0bb62),
      Color(0xfff0bb62),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
  );

  static const gradientBlueDashboard = LinearGradient(
    colors: [
      ColorConst.blue100,
      ColorConst.blue100,
      ColorConst.blue90,
      ColorConst.green100,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
  );

  static const gradientBlue = LinearGradient(
    colors: [
      ColorConst.blue100,
      ColorConst.blue100,
      ColorConst.blue100,
      ColorConst.blue90,
      ColorConst.green50,
      ColorConst.green50,
      ColorConst.green50,
      ColorConst.green70,
      ColorConst.green80,
      ColorConst.green100,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
  );

  static const Color textColour100 = Color(0xff0d0d0d);

  static const Color textColour90 = Color(0xff252525);

  static const Color textColour80 = Color(0xff3d3d3d);

  static const Color textColour70 = Color(0xff565656);

  static const Color textColour60 = Color(0xff6e6e6e);

  static const Color textColour50 = Color(0xff868686);

  static const Color textColour40 = Color(0xff9e9e9e);

  static const Color textColour30 = Color(0xffb6b6b6);

  static const Color textColour20 = Color(0xffcfcfcf);

  static const Color textColour10 = Color(0xfff2f2f2);

  static const Color textColour00 = Color(0xffffffff);

  static const Color warningBorder = Color(0xffffd24d);

  static const Color warningSurface = Color(0xffffe599);

  static const Color warningMain = Color(0xffffbf00);

  static const Color orangeRiders = Color(0xffff9b25);
  static const Color pinkRiders = Color(0xffFA6C71);
  // #276297
  static const Color blueText = Color(0xff276297);

  static const Color backgroundTextField = Color(0xfff6f6f6);

  // rgba(255, 255, 255, 0.5)
  static const Color backgroundProfileWhite = Color.fromRGBO(255, 255, 255, 0.5);

  static const Color eventIconColor = Color(0xff387CB9);

}
