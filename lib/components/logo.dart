import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:projectasahi/components/asset_image.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1100.0 / 250.0,
      child: Hero(
        tag: 'logo',
        child: PlatformAwareAssetImage(
          asset: "projectasahi_logo.webp",
        ),
      ),
    );
  }
}
