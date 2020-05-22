import 'package:flutter/material.dart';
import 'package:projectasahi/route.dart';

void main() {
  runApp(RootView());
}

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      // navigatorObservers: [HeroController(createRectTween: _createRectTween)],
      onGenerateRoute: generateRoute,
      textStyle: const TextStyle(color: Colors.black),
      initialRoute: "/",
      color: Colors.blue,
    );
  }
  RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }
}