import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    var path = Path();
    var pointHeight = size.height - 50;

    path.lineTo(0.0, pointHeight);
    path.quadraticBezierTo(size.width / 2, size.height + 30, size.width, pointHeight);
    path.lineTo(size.width, 0.0);


    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}