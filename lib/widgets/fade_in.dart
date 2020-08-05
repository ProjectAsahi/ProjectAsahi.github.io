import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateY, translateX }

class FadeIn extends StatelessWidget {
  final double delay;
  final Widget child;
  final double translateY;
  final double translateX;
  final double opacity;
  final int duration;
  final Cubic curves;

  FadeIn(
      {this.delay = 0.0,
      this.child,
      this.duration = 500,
      this.curves = Curves.easeOutQuart,
      this.translateY = 0.0,
      this.translateX = 0.0,
      this.opacity = 0.0});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(
          AniProps.opacity, opacity.tweenTo(1.0), duration.milliseconds, curves)
      ..add(AniProps.translateY, translateY.tweenTo(0.0), duration.milliseconds,
          curves)
      ..add(AniProps.translateX, translateX.tweenTo(0.0), duration.milliseconds,
          curves);

    return PlayAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
            offset: Offset(
                value.get(AniProps.translateX), value.get(AniProps.translateY)),
            child: child),
      ),
    );
  }
}
