import 'package:flutter/material.dart';
import 'package:projectasahi/route.dart';

void main() {
  runApp(RootView());
}

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: "ProjectAsahi",
      navigatorObservers: [HeroController()],
      onGenerateRoute: generateRoute,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: "SourceHanSans"
      ),
      initialRoute: "/",
      color: Colors.blue,
    );
  }
}
