import 'package:flutter/material.dart';
import 'package:projectasahi/widgets/platform_aware_asset_image.dart';

class CharacterDetailScene extends StatefulWidget {
  final String id;

  const CharacterDetailScene({Key key, this.id}) : super(key: key);
  @override
  CharacterDetailSceneState createState() => CharacterDetailSceneState();
}

class CharacterDetailSceneState extends State<CharacterDetailScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Stack(
          children: [
            Center(
              child: Hero(
                tag: 'avatar_main_visual_' + widget.id,
                child: PlatformAwareAssetImage(
                  asset: widget.id + '/main_visual.webp',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
