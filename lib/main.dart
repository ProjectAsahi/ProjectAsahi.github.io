import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:projectasahi/route.dart';

void main() {
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('zh'), Locale('en'), Locale('ja')],
        path: 'assets/translations',
        fallbackLocale: Locale('zh'),
        child: RootView()),
  );
}

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: "ProjectAsahi",
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorObservers: [HeroController()],
      onGenerateRoute: generateRoute,
      textStyle: const TextStyle(
          color: Colors.black, fontSize: 16, fontFamily: "SourceHanSans"),
      initialRoute: "/",
      color: Colors.blue,
    );
  }
}
