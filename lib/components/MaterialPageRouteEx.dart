import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const ROUTE_TRANSITION_DURATION = 666;

class MaterialPageRouteEx<T> extends MaterialPageRoute<T> {
  @override
  final Duration transitionDuration;

  MaterialPageRouteEx({
    @required WidgetBuilder builder,
    RouteSettings settings,
    maintainState = true,
    bool fullscreenDialog = false,
    this.transitionDuration =
        const Duration(milliseconds: ROUTE_TRANSITION_DURATION),
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
}

class CupertinoPageRouteEx<T> extends CupertinoPageRoute<T> {
  @override
  final Duration transitionDuration;

  final PageTransitionsBuilder transitionsBuilder;

  CupertinoPageRouteEx({
    @required WidgetBuilder builder,
    RouteSettings settings,
    maintainState = true,
    bool fullscreenDialog = false,
    this.transitionsBuilder,
    this.transitionDuration =
        const Duration(milliseconds: ROUTE_TRANSITION_DURATION),
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return transitionsBuilder?.buildTransitions(
            this, context, animation, secondaryAnimation, child) ??
        super.buildTransitions(context, animation, secondaryAnimation, child);
  }
}

class FadePageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _FadePageTransition(routeAnimation: animation, child: child);
  }
}

// Slides the page upwards and fades it in, starting from 1/4 screen
// below the top.
class _FadePageTransition extends StatelessWidget {
  _FadePageTransition({
    Key key,
    @required
        Animation<double>
            routeAnimation, // The route's linear 0.0 - 1.0 animation.
    @required this.child,
  })  : _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 0.25),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
      CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: child,
    );
  }
}
