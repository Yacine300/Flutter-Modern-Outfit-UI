import 'package:flutter/material.dart';

class SizeConfiguration {
  static MediaQueryData _mediaQueryData;
  static double screenheight;
  static double screenwidth;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenheight = _mediaQueryData.size.height;
    screenwidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenheight * 0.24
        : screenwidth * 0.24;
  }
}
