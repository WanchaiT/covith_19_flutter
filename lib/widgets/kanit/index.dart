import 'dart:ui';

import 'package:flutter/material.dart';

enum KanitStyle {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  subtitle1,
  subtitle2,
  body1,
  body2,
  button,
  caption,
  overline,
}

/*
 - asset: assets/fonts/Kanit-Light.ttf
          weight: 300
        - asset: assets/fonts/Kanit-Regular.ttf
          weight: 400
        - asset: assets/fonts/Kanit-Medium.ttf
          weight: 500
        - asset: assets/fonts/Kanit-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Kanit-Bold.ttf
          weight: 700
          */

final Map<String, TextStyle> _kanitStyleMap = Map.from({
  KanitStyle.h1.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w400, fontSize: 85.0),
  KanitStyle.h2.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w400, fontSize: 60.0),
  KanitStyle.h3.toString(): const TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w400, fontSize: 48.0),
  KanitStyle.h4.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w400, fontSize: 34.0),
  KanitStyle.h5.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w400, fontSize: 24.0),
  KanitStyle.h6.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w500, fontSize: 20.0),
  KanitStyle.subtitle1.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w500, fontSize: 16.0),
  KanitStyle.subtitle2.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w500, fontSize: 14.0),
  KanitStyle.body1.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w400, fontSize: 16.0),
  KanitStyle.body2.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w400, fontSize: 14.0),
  KanitStyle.button.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w500, fontSize: 14.0),
  KanitStyle.caption.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w400, fontSize: 12.0),
  KanitStyle.overline.toString(): TextStyle(
      fontFamily: 'Kanit', fontWeight: FontWeight.w500, fontSize: 12.0),
});

class Kanit extends StatelessWidget {
  String text;
  final KanitStyle style;
  TextAlign? textAlign;
  TextDirection? textDirection;
  int? maxLines;
  Color? color;
  Color? backgroundColor;
  TextOverflow? overflow;
  Color? decorationColor;
  TextDecoration? decoration;
  double? decorationThickness;
  TextDecorationStyle? decorationStyle;
  double? letterSpacing;
  double? wordSpacing;
  TextBaseline? textBaseline;
  List<Shadow>? shadows;

  Kanit(
    this.text, {
    Key? key,
    this.style = KanitStyle.body1,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.color = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.overflow = TextOverflow.visible,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.letterSpacing,
    this.textBaseline,
    this.wordSpacing,
    this.shadows,
  }) : super(key: key);
  // Kanit()
  @override
  Widget build(BuildContext context) {
    var keyStyle = style.toString();
    style == KanitStyle.button ? text = text.toUpperCase() : '';
    var kanitStyle = _kanitStyleMap[keyStyle];

    TextStyle textStyle = TextStyle(
        fontFamily: kanitStyle!.fontFamily,
        fontWeight: kanitStyle.fontWeight,
        fontSize: kanitStyle.fontSize,
        color: color,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        decoration: decoration,
        backgroundColor: backgroundColor,
        letterSpacing: letterSpacing,
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
        shadows: shadows);

    return Text(text,
        style: textStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        maxLines: maxLines,
        overflow: overflow,
        textScaleFactor: 1.0);
    // onPressed: () {
    //   Get.back();
    // },
  }
}
