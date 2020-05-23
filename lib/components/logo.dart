import 'dart:math';
import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: min(size.width, 600),
      child: AspectRatio(
        aspectRatio: 1100.0 / 250.0,
        child: Image.asset('projectasahi_logo.webp'),
      ),
    );
  }
}
