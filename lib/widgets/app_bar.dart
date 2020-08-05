import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projectasahi/widgets/platform_aware_asset_image.dart';
import 'package:projectasahi/widgets/top_menu.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final logoHeight =
        mediaQuery.size.width > 480 ? 50 : mediaQuery.size.height * 0.04;
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1280),
        child: Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/');
                },
                child: Hero(
                  tag: 'appbar',
                  child: PlatformAwareAssetImage(
                    height: logoHeight,
                    asset: 'logo.webp',
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            TopMenuWidget(),
          ],
        ),
      ),
    );
  }
}
