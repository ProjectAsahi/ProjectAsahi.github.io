import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

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
    if (kIsWeb) {
      return Image.network(
        'assets/${package == null ? '' : 'packages/$package/'}$asset',
        fit: fit,
        alignment: alignment,
      );
    }

    return Image.asset(
      asset,
      package: package,
      fit: fit,
      alignment: alignment,
    );
  }
}
