import 'package:flutter/material.dart';
import 'package:projectasahi/route.dart';
import 'package:easy_localization/easy_localization.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProjectAsahi',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        accentColor: Colors.pinkAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        accentColor: Colors.pinkAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: '/',
    );
  }
}
