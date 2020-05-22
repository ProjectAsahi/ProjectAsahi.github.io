import 'dart:math';

import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final Logo = () => HookBuilder(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Container(
        width: min(size.width, 768),
        child: AspectRatio(
          aspectRatio: 1100.0 / 250.0,
          child: EasyWebView(
            webAllowFullScreen: false,
            src: "/logo_runner.html",
          ),
        ),
      );
    });
