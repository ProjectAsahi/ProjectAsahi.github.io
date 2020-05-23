
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { translateY, translateX }

class SlideIn extends StatelessWidget {
  final double delay;
  final Widget child;
  final double translateY;
  final double translateYTo;
  final double translateX;
  final double translateXTo;
  final int duration;
  final Cubic curves;

  SlideIn({
    this.delay = 0.0,
    this.child,
    this.duration = 500,
    this.curves = Curves.easeInOutCirc,
    this.translateY = 0.0,
    this.translateX = 0.0,
    this.translateYTo = 0.0,
    this.translateXTo = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(AniProps.translateY, translateY.tweenTo(translateYTo),
          duration.milliseconds, curves)
      ..add(AniProps.translateX, translateX.tweenTo(translateXTo),
          duration.milliseconds, curves);

    return PlayAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Transform.translate(
          offset: Offset(
              value.get(AniProps.translateX), value.get(AniProps.translateY)),
          child: child),
    );
  }
}
