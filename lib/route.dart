import 'package:flutter/material.dart';
import 'package:projectasahi/material/material_page_route_ex.dart';
import 'package:projectasahi/scenes/character_detail_scene.dart';
import 'package:projectasahi/scenes/characters_scene.dart';
import 'package:projectasahi/scenes/home_scene.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.name.startsWith("/character")) {
    if (settings.name == '/character') {
      return MaterialPageRouteEx(
        builder: (_) => CharactersScene(),
        settings: settings,
      );
    } else {
      return CupertinoPageRouteEx(
        builder: (_) => CharacterDetailScene(
          id: settings.name.split('/')[2],
        ),
        settings: settings,
      );
    }
  }
  return MaterialPageRouteEx(builder: (_) => HomeScene(), settings: settings);
}
