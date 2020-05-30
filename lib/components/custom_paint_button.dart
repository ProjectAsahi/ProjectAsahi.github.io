import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomPaintButton extends StatelessWidget {
  final Function onTap;
  final Color color;
  final Color iconColor;
  final Widget child;
  final CustomPainter painter;

  const CustomPaintButton(
      {Key key,
      this.onTap,
      this.color = Colors.white,
      this.iconColor = Colors.black,
      this.child,
      this.painter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkResponse(
        mouseCursor: SystemMouseCursors.click,
        onTap: () {
          onTap.call();
        },
        child: Container(
          child: CustomPaint(
            painter: painter,
            child: child,
          ),
        ),
      ),
    );
  }
}
