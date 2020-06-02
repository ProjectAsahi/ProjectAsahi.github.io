import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart' as html;

class PlatformAwareAssetImage extends StatelessWidget {
  final BoxFit fit;
  final Alignment alignment;
  final String asset;
  final String package;

  const PlatformAwareAssetImage({
    Key key,
    this.asset,
    this.package,
    this.fit,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String res = asset;

    if (kIsWeb) {
      // workground for webp
      if (html.window.navigator.vendor == 'Apple Computer, Inc.') {
        res = res.replaceAll('webp', 'png');
      }
      return Image.network(
        'assets/assets/images/${package == null ? '' : 'packages/$package/'}$res',
        fit: fit,
        alignment: alignment,
      );
    }

    return Image.asset(
      'assets/images/$res',
      package: package,
      fit: fit,
      alignment: alignment,
    );
  }
}
