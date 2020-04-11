import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 6);
    path.quadraticBezierTo(size.width / 2, size.height / 3, size.width, 0.0);
    path.lineTo(size.width, size.height / 4 + 80);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.45, 0.0, size.height / 6 + 50);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}