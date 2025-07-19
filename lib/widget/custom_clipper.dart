
import 'package:flutter/material.dart';

class CustomHomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Start point
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - 50); // Bottom circular path
    path.lineTo(size.width, 0); // Right side
    path.close(); // Top side
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}