// App Icons
import 'dart:ui';

import 'package:flutter/material.dart';

class AppIcons {
  static const icEdit = 'assets/icons/edit.png';
  static const icArrow = 'assets/icons/arrow.png';
}

// Text Styles
TextStyle boldSFTextStyle({double size, Color color, double height}) =>
    TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: size,
        color: color ?? Colors.black,
        height: height);
TextStyle regularSFTextStyle({double size, Color color, double height}) =>
    TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w300,
      fontSize: size,
      color: color ?? Colors.black,
      height: height,);
TextStyle mediumSFTextStyle({double size, Color color, double height}) =>
    TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: size,
        color: color ?? Colors.black,
        height: height);