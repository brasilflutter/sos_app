import 'package:flutter/material.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required String fontFamily,
  required FontWeight fontWeight,
  required Color color,
  required TextDecoration decoration,
  double? height,
  TextOverflow? overflow,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
    decoration: decoration,
    decorationColor: color,
    height: height ?? 1,
    overflow: overflow ?? TextOverflow.ellipsis,
  );
}

// regular style

TextStyle getRegularStyle({
  required Color color,
  double fontSize = 12,
  TextDecoration decoration = TextDecoration.none,
  double? height,
  TextOverflow? overflow,
}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeightManager.regular,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}
// light text style

TextStyle getLightStyle({
  required Color color,
  double fontSize = 12,
  TextDecoration decoration = TextDecoration.none,
  double height = 1,
}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeightManager.light,
    decoration: decoration,
    height: height,
  );
}
// bold text style

TextStyle getBoldStyle({
  required Color color,
  double fontSize = 12,
  TextDecoration decoration = TextDecoration.none,
  double height = 1,
  TextOverflow? overflow,
}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeightManager.bold,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}

// semi bold text style

TextStyle getSemiBoldStyle({
  required Color color,
  double fontSize = 12,
  TextDecoration decoration = TextDecoration.none,
  double height = 1,
  TextOverflow? overflow,
}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeightManager.semiBold,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}

// medium text style

TextStyle getMediumStyle({
  required Color color,
  double fontSize = 12,
  TextDecoration decoration = TextDecoration.none,
  double height = 1,
  TextOverflow? overflow,
}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeightManager.medium,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}

class FontConstants {
  static const String fontFamily = 'Montserrat';
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}
