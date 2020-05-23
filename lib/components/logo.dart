import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:projectasahi/components/asset_image.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: min(size.width, 600),
      child: AspectRatio(
        aspectRatio: 1100.0 / 250.0,
        child: PlatformAwareAssetImage(
          asset: "projectasahi_logo.webp",
        ),
      ),
    );
  }
}
