import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  final double side;

  TrianglePainter(
      {this.side = 100,
      this.strokeColor = Colors.black,
      this.strokeWidth = 0,
      this.paintingStyle = PaintingStyle.fill});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(), paint);
  }

  Path getTrianglePath() {
    var h = side * (sqrt(3) / 2);
    return Path()
      ..moveTo(0, -h / 2)
      ..lineTo(-side / 2, h / 2)
      ..lineTo(side / 2, h / 2)
      ..lineTo(0, -h / 2);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
