import 'package:flutter/material.dart';

class Responsive {
  static double getHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  static double getWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * (percentage / 100);
  }
}
