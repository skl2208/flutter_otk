// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';

class MyAppStyle {
  MyAppStyle({this.def_fontsize});

  double? def_fontsize = 15.0;

  TextStyle title() {
    return TextStyle(
        fontFamily: "Prompt",
        fontSize: def_fontsize,
        fontWeight: FontWeight.bold);
  }

  TextStyle subtitle() {
    return TextStyle(
      fontFamily: "Prompt",
      fontSize: def_fontsize,
    );
  }

  TextStyle normal() {
    return TextStyle(
      fontFamily: "Prompt",
      fontSize: def_fontsize,
    );
  }
}

SizedBox spaceBox(double heightpixel) {
  return SizedBox(
    width: double.infinity,
    height: heightpixel,
  );
}
