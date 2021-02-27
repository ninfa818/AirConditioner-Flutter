import 'package:flutter/material.dart';

const double offsetXLg = 40.0;
const double offsetLg = 32.0;
const double offsetXMd = 24.0;
const double offsetMd = 20.0;
const double offsetBase = 16.0;
const double offsetSm = 8.0;
const double offsetXSm = 4.0;

class Dimension {
  Size screenSize;
  Dimension(this.screenSize);

  double widthSm = 420;
  double widthMd = 800;
  double widthLg = 1024;

  double wp(percentage) {
    return percentage / 100 * screenSize.width;
  }

  double hp(percentage) {
    return percentage / 100 * screenSize.height;
  }

  double getWidthPx(int pixels) {
    return (pixels / 3.61) / 100 * screenSize.width;
  }

  double sValue(double value) {
    if (screenSize.width > widthLg) {
      return value * 1.5;
    } else if (screenSize.width > widthMd) {
      return value * 1.35;
    } else if (screenSize.width > widthSm) {
      return value * 1.2;
    } else {
      return value;
    }
  }

  int getStatus() {
    if (screenSize.width > widthLg) {
      return 3;
    } else if (screenSize.width > widthMd) {
      return 2;
    } else if (screenSize.width > widthSm) {
      return 1;
    } else {
      return 0;
    }
  }

}