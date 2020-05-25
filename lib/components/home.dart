import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:projectasahi/components/asset_image.dart';
import 'package:projectasahi/components/fade_in.dart';
import 'package:projectasahi/components/logo.dart';
import 'package:projectasahi/data/character_data.dart';
import 'package:projectasahi/extensions/iterable.dart';
import 'package:projectasahi/extensions/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final isMobile =
        size.width < 1024 || mediaQuery.orientation == Orientation.portrait;
    final charastersItems = characters
        .mapIndex(
          (value, index) => Expanded(
            child: _CharacterBoard(
                image: value.main_visual,
                onTab: () {
                  if (value.enabled) {
                    Navigator.pushNamed(context, "/character/" + value.name_en);
                  }
                },
                color: value.color,
                isMobile: isMobile,
                showDelay: 2,
                translateY: index % 2 == 0 ? -130.0 : 130.0),
          ),
        )
        .toList();
    if (isMobile) {
      charastersItems.add(Expanded(child: _Banner()));
    }
    return Stack(
      children: [
        Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          children: charastersItems,
        ),
        Visibility(
          visible: !isMobile,
          child: Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _Banner(),
          ),
        )
      ],
    );
  }
}

class _Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      delay: 3,
      curves: Curves.easeOutExpo,
      duration: 1000,
      opacity: 1,
      translateY: size.height,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.87),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 8,
                blurRadius: 16,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: Container(
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Container(
                          width: min(size.width, 600),
                          child: Logo(),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              launch("https://space.bilibili.com/146407");
                            },
                            icon: PlatformAwareAssetImage(
                              asset: "bilibili_logo_colored.webp",
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              launch("https://weibo.com/AsahiTakagaki");
                            },
                            icon: PlatformAwareAssetImage(
                              asset: "weibo_logo_colored.webp",
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/about');
                            },
                            icon: PlatformAwareAssetImage(
                              asset: "help_icon.webp",
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

final _CharacterBoard = (
        {String image,
        double showDelay,
        double translateY,
        Color color,
        GestureTapCallback onTab,
        bool isMobile = false}) =>
    HookBuilder(builder: (context) {
      final isPointerOver = useState(false);
      final size = MediaQuery.of(context).size;
      return FadeIn(
        delay: 0.0,
        opacity: 1.0,
        translateY: isMobile ? 0 : translateY > 0 ? size.height : -size.height,
        translateX: isMobile ? translateY > 0 ? size.width : -size.width : 0,
        child: Material(
          color: color,
          child: InkWell(
            onHover: (value) => isPointerOver.value = value,
            onTap: () => onTab.call(),
            child: Container(
              child: Stack(
                children: [
                  Container(color: color),
                  FadeIn(
                    curves: Curves.easeOutExpo,
                    delay: showDelay + 0.5,
                    translateX: isMobile ? translateY : 0.0,
                    translateY: isMobile ? 0.0 : translateY,
                    child: FractionallySizedBox(
                      alignment:
                          isMobile ? Alignment.topCenter : Alignment(-1, -1),
                      widthFactor: isMobile ? 1 : 1.3,
                      child: PlatformAwareAssetImage(
                        asset: image,
                        alignment: isMobile
                            ? Alignment(0, -0.80)
                            : Alignment(-0.66, -1),
                        fit: BoxFit.cover,
                      ).showCursorOnHover,
                    ),
                  ),
                  FadeIn(
                    delay: 3.0,
                    opacity: 0.0,
                    duration: 1000,
                    child: AnimatedOpacity(
                      opacity: isPointerOver.value ? 0.0 : 1.0,
                      child: Container(
                        color: color.withOpacity(0.5),
                      ),
                      curve: Curves.easeOutExpo,
                      duration: Duration(milliseconds: 250),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
