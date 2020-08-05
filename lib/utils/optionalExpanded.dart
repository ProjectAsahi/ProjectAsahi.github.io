import 'package:flutter/material.dart';

Widget optionalExpanded(BuildContext context, Widget child) {
  final mediaQuery = MediaQuery.of(context);
  if (mediaQuery.size.aspectRatio > 1) {
    return Expanded(child: child);
  } else {
    return child;
  }
}
