import 'dart:math';

import 'package:flutter/cupertino.dart';

double calcStandardPadding(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return min(mediaQuery.size.width, mediaQuery.size.height) > 480 ? 32.0 : 8.0;
}
