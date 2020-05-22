import 'package:flutter/material.dart';
import 'package:projectasahi/route.dart';

void main() {
  runApp(RootView());
}

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      onGenerateRoute: generateRoute,
      textStyle: const TextStyle(color: Colors.black),
      initialRoute: "/",
      color: Colors.blue,
    );
  }
}
