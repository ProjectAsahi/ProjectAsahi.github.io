import 'package:flutter/material.dart';

import '../data/characters.dart';
import '../widgets/platform_aware_asset_image.dart';
import '../widgets/platform_aware_asset_image.dart';

class AltHomeScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final logoHeight =
        mediaQuery.size.width > 480 ? 50.0 : mediaQuery.size.height * 0.04;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: Row(
                children: characters
                    .map(
                      (e) => Expanded(
                        child: _HomeItem(
                          data: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Positioned(
              height: mediaQuery.size.height * 0.2,
              bottom: 0,
              left: 0,
              right: 0,
              child: Material(
                child: Center(
                  child: PlatformAwareAssetImage(
                    height: logoHeight,
                    asset: 'logo.webp',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _HomeItem extends StatelessWidget {
  final CharacterData data;

  const _HomeItem({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: data.color,
          ),
        ),
        Center(
          child: Hero(
            tag: 'avatar_main_visual_' + data.id,
            child: Opacity(
              opacity: 0.87,
              child: PlatformAwareAssetImage(
                height: query.size.height * 0.88,
                fit: BoxFit.cover,
                alignment: data.mainVisualAlignment,
                asset: data.mainVisual,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/character/' + data.id);
            },
            child: Container(),
          ),
        ),
      ],
    );
  }
}
