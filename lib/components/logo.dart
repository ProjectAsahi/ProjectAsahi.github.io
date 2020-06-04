import 'package:flutter/widgets.dart';
import 'package:projectasahi/components/platform_aware_asset_image.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3423.0 / 462.0,
      child: Hero(
        tag: 'logo',
        child: PlatformAwareAssetImage(
          asset: "projectasahi_logo.webp",
        ),
      ),
    );
  }
}
