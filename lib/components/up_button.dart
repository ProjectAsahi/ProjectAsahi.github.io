import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projectasahi/components/custom_paint_button.dart';

class UpButton extends StatelessWidget {
  final Function onTap;
  final Color color;
  final Color iconColor;

  const UpButton(
      {Key key,
      this.onTap,
      this.color = Colors.white,
      this.iconColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaintButton(
      onTap: () {
        onTap.call();
      },
      painter: _UpButtonBackgroundPainter(color: color),
      child: Padding(
        padding: EdgeInsets.only(left: 72, right: 72, top: 12, bottom: 12),
        child: Icon(
          Icons.keyboard_arrow_down,
          color: iconColor,
          size: 32,
        ),
      ),
    );
  }
}

class _UpButtonBackgroundPainter extends CustomPainter {
  final Color color;
  final PaintingStyle paintingStyle;

  _UpButtonBackgroundPainter(
      {this.color = Colors.white, this.paintingStyle = PaintingStyle.fill});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..isAntiAlias = true
      ..style = paintingStyle;
    final path = getTrianglePath(size);
    // canvas.drawShadow(path, Colors.black, 4.0, false);
    canvas.drawPath(path, paint);
  }

  Path getTrianglePath(Size size) {
    final width = size.width;
    final height = size.height;
    return Path()
      ..moveTo(0, 0)
      ..lineTo(width / 5, height)
      ..lineTo(width / 5 * 4, height)
      ..lineTo(width, 0)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(_UpButtonBackgroundPainter oldDelegate) {
    return oldDelegate.paintingStyle != paintingStyle;
  }
}
