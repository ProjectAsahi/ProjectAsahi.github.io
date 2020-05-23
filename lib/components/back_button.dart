import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackButtonEx extends StatelessWidget {
  final Function onTap;
  final Color color;
  final Color iconColor;

  const BackButtonEx(
      {Key key,
      this.onTap,
      this.color = Colors.white,
      this.iconColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        child: CustomPaint(
          painter: _BackButtonBackgroundPainter(color: color),
          child: Padding(
            padding: EdgeInsets.only(left: 48, right: 80, top: 16, bottom: 16),
            child: Material(
              color: Colors.transparent,
              child: Icon(
                Icons.arrow_back_ios,
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BackButtonBackgroundPainter extends CustomPainter {
  final Color color;
  final PaintingStyle paintingStyle;

  _BackButtonBackgroundPainter(
      {this.color = Colors.white, this.paintingStyle = PaintingStyle.fill});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..isAntiAlias = true
      ..style = paintingStyle;
    final path = getTrianglePath(size);
    canvas.drawShadow(path, Colors.black, 4.0, false);
    canvas.drawPath(path, paint);
  }

  Path getTrianglePath(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 5 * 4, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(_BackButtonBackgroundPainter oldDelegate) {
    return oldDelegate.paintingStyle != paintingStyle;
  }
}
