import 'package:flutter/material.dart';
import 'package:projectasahi/material/material_page_route_ex.dart';
import 'package:projectasahi/scenes/character_detail_scene.dart';
import 'package:projectasahi/scenes/characters_scene.dart';
import 'package:projectasahi/scenes/home_scene.dart';
import 'package:projectasahi/scenes/image_dialog.dart';

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
  if (settings.name.startsWith('/gallery')) {
    final values = settings.name.split('/');
    if (values.length == 4) {
      return MaterialPageRouteEx(
        builder: (_) => ImageDialog(
          characterId: values[2],
          galleryAssetName: Uri.decodeComponent(values[3]),
        ),
        settings: settings,
      );
    }
  }
  return MaterialPageRouteEx(builder: (_) => HomeScene(), settings: settings);
}
