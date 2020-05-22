import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:projectasahi/components/detail.dart';
import 'package:projectasahi/components/fade_in.dart';
import 'package:projectasahi/components/triangle_painter.dart';
import 'package:projectasahi/extensions/hex_color.dart';
import 'package:projectasahi/extensions/hover_extensions.dart';

final Home = () => HookBuilder(builder: (context) {
      final size = MediaQuery.of(context).size;
      final isMobile = size.width <= 1024;
      return Stack(
        children: [
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              _CharacterBoard(
                  image: AssetImage('avatar.webp'),
                  onTab: () => Navigator.pushNamed(context, "/detail",
                      arguments: DetailArguments("asahi")),
                  color: Colors.greenAccent,
                  isMobile: isMobile,
                  showDelay: 0.33,
                  translateY: -130.0),
              _CharacterBoard(
                  image: AssetImage('avatar.webp'),
                  onTab: () => Navigator.pushNamed(context, "/detail",
                      arguments: DetailArguments("asahi")),
                  color: Colors.grey,
                  isMobile: isMobile,
                  showDelay: 1.33,
                  translateY: 130.0),
              _CharacterBoard(
                  image: AssetImage('avatar.webp'),
                  onTab: () => Navigator.pushNamed(context, "/detail",
                      arguments: DetailArguments("asahi")),
                  color: Colors.redAccent,
                  isMobile: isMobile,
                  showDelay: 1.66,
                  translateY: -130.0),
              _CharacterBoard(
                  image: AssetImage('avatar.webp'),
                  onTab: () => Navigator.pushNamed(context, "/detail",
                      arguments: DetailArguments("asahi")),
                  color: Colors.purpleAccent,
                  isMobile: isMobile,
                  showDelay: 0.66,
                  translateY: 130.0),
            ],
          ),
          // Logo(),
        ],
      );
    });

final Logo = () => HookBuilder(builder: (context) {
      const triangleSide = 150.0;
      final triangleOffset = triangleSide * (sqrt(3) / 2) / 2;
      final animationController =
          useAnimationController(duration: Duration(milliseconds: 1000));
      useEffect(() {
        animationController.forward();
      });
      return Stack(
        children: [
          Center(
            child: Container(
              color: Colors.indigo,
              child: Transform.translate(
                offset: Offset(0, 0),
                child: CustomPaint(
                  painter: TrianglePainter(
                      side: triangleSide,
                      strokeColor: HexColor.fromHex("#ff3fb9")),
                ),
              ),
            ),
          ),
          Center(
            child: Transform.translate(
              offset: Offset(-triangleOffset, 0),
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(120 / 360),
                child: CustomPaint(
                  painter: TrianglePainter(
                      side: triangleSide,
                      strokeColor: HexColor.fromHex("#0080ff")),
                ),
              ),
            ),
          ),
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
      // final animationController =
      //     useAnimationController(duration: Duration(milliseconds: 250));
      // final animation = useAnimation(IntTween(begin: 100, end: 150).animate(
      //     new CurvedAnimation(
      //         parent: animationController, curve: Curves.easeInOutCirc)));
      // useEffect(() {
      //   if (isPointerOver.value) {
      //     animationController.forward();
      //   } else {
      //     animationController.reverse();
      //   }
      // }, [isPointerOver.value]);
      return Expanded(
        flex: 100,
        child: MouseRegion(
          onEnter: (_) => isPointerOver.value = true,
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
                    translateX: isMobile
                        ? translateY > 0 ? size.width : -size.width
                        : 0,
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
                      child: Image(
                        image: image,
                        alignment: isMobile
                            ? Alignment(0, -0.80)
                            : Alignment(-0.66, -1),
                        fit: BoxFit.cover,
                      ).showCursorOnHover,
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
        ),
      );
    });
