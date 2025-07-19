import 'package:flutter/material.dart';

class ResponsiveSize {
  static sizeHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static sizeWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
