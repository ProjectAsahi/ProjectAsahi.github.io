import 'package:flutter/material.dart';
import 'package:projectasahi/material/material_page_route_ex.dart';
import 'package:projectasahi/scenes/character_detail_scene.dart';
import 'package:projectasahi/scenes/home_scene.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.name.startsWith("/character")) {
    return CupertinoPageRouteEx(
      builder: (_) => CharacterDetailScene(
        id: settings.name.split('/')[2],
      ),
      settings: settings,
    );
  }
  return MaterialPageRouteEx(builder: (_) => HomeScene(), settings: settings);
  // if (settings.name.startsWith("/character")) {
  //   return MaterialPageRouteEx(
  //     builder: (_) => Character(settings.name.split('/')[2]),
  //     settings: settings,
  //   );
  // } else if (settings.name.startsWith("/assets")) {
  //   return MaterialPageRouteEx(
  //     builder: (_) => ImageDialog(
  //       name: Uri.decodeComponent(settings.name.split('/')[2]),
  //     ),
  //     settings: settings,
  //     fullscreenDialog: true,
  //   );
  // } else if (settings.name.startsWith('/about')) {
  //   return MaterialPageRouteEx(
  //     builder: (_) => About(),
  //     settings: settings,
  //     fullscreenDialog: true,
  //   );
  // } else {
  //   return MaterialPageRouteEx(
  //     builder: (_) => HomeScene(),
  //     settings: settings,
  //   );
  // }
}
