import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:projectasahi/app.dart';

void main() {
  runApp(
    EasyLocalization(
      child: App(),
      supportedLocales: [Locale('en'), Locale('zh'), Locale('ja')],
      fallbackLocale: Locale('zh'),
      path: 'assets/translations',
    ),
  );
}
