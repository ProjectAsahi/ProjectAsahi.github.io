import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:projectasahi/components/fade_in.dart';
import 'package:projectasahi/components/logo.dart';
import 'package:projectasahi/extensions/hover_extensions.dart';

final Home = () => HookBuilder(builder: (context) {
      final size = MediaQuery.of(context).size;
      final isMobile = size.width <= 1024;
      return Stack(
        children: [
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                child: _CharacterBoard(
                    image: AssetImage('avatar.webp'),
                    onTab: () =>
                        Navigator.pushNamed(context, "/character/asahi"),
                    color: Colors.greenAccent,
                    isMobile: isMobile,
                    showDelay: 1.5,
                    translateY: -130.0),
              ),
              Expanded(
                child: _CharacterBoard(
                    image: AssetImage('avatar.webp'),
                    onTab: () =>
                        Navigator.pushNamed(context, "/character/asahi"),
                    color: Colors.grey,
                    isMobile: isMobile,
                    showDelay: 1.5,
                    translateY: 130.0),
              ),
              Expanded(
                child: _CharacterBoard(
                    image: AssetImage('avatar.webp'),
                    onTab: () =>
                        Navigator.pushNamed(context, "/character/asahi"),
                    color: Colors.redAccent,
                    isMobile: isMobile,
                    showDelay: 1.5,
                    translateY: -130.0),
              ),
              Expanded(
                child: _CharacterBoard(
                    image: AssetImage('avatar.webp'),
                    onTab: () =>
                        Navigator.pushNamed(context, "/character/asahi"),
                    color: Colors.purpleAccent,
                    isMobile: isMobile,
                    showDelay: 1.5,
                    translateY: 130.0),
              ),
            ],
          ),
          Visibility(
            visible: !isMobile,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.87),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Logo(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });

final _CharacterBoard = (
        {ImageProvider image,
        double showDelay,
        double translateY,
        Color color,
        GestureTapCallback onTab,
        bool isMobile = false}) =>
    HookBuilder(builder: (context) {
      final isPointerOver = useState(false);
      final size = MediaQuery.of(context).size;
      return MouseRegion(
        onHover: (_) => isPointerOver.value = true,
        onExit: (_) => isPointerOver.value = false,
        child: GestureDetector(
          onTap: onTab,
          child: Container(
            child: Stack(
              children: [
                FadeIn(
                  delay: 0.0,
                  opacity: 1.0,
                  translateY: isMobile
                      ? 0
                      : translateY > 0 ? size.height : -size.height,
                  translateX:
                      isMobile ? translateY > 0 ? size.width : -size.width : 0,
                  child: Container(color: color),
                ),
                FadeIn(
                  delay: showDelay + 0.5,
                  translateX: isMobile ? translateY : 0.0,
                  translateY: isMobile ? 0.0 : translateY,
                  child: FractionallySizedBox(
                    alignment:
                        isMobile ? Alignment.topCenter : Alignment(-1, -1),
                    widthFactor: isMobile ? 1 : 1.3,
                    child: Hero(
                      tag: 'chimg',
                      child: Image(
                        image: image,
                        alignment: isMobile
                            ? Alignment(0, -0.80)
                            : Alignment(-0.66, -1),
                        fit: BoxFit.cover,
                      ).showCursorOnHover,
                    ),
                  ),
                ),
                FadeIn(
                  delay: 5.0,
                  opacity: 0.0,
                  child: AnimatedOpacity(
                    opacity: isPointerOver.value ? 0.0 : 1.0,
                    child: Container(
                      color: color.withOpacity(0.5),
                    ),
                    curve: Curves.easeInOutCirc,
                    duration: Duration(milliseconds: 250),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
