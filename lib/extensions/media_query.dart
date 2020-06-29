
import 'package:flutter/widgets.dart';

extension Aspectratio on MediaQueryData {
  bool get isVertical => size.height > size.width;
}