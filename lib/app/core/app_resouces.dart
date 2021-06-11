import 'dart:ui';

import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs
/// App Icons
class AppIcons {
  static const icEdit = 'assets/icons/edit.png';
  static const icArrow = 'assets/icons/arrow.png';
}

/// Font family
const String fontFamily = 'Roboto';

/// Font bold
TextStyle boldSFTextStyle({double? size, Color? color, double? height}) =>
    TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: size ?? 14,
        color: color ?? Colors.black,
        height: height);

/// Font regular
TextStyle regularSFTextStyle({double? size, Color? color, double? height}) =>
    TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: size ?? 14,
      color: color ?? Colors.black,
      height: height,
    );

/// Font medium
TextStyle mediumSFTextStyle({double? size, Color? color, double? height}) =>
    TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: size ?? 14,
        color: color ?? Colors.black,
        height: height);
