import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const ROUTE_TRANSITION_DURATION = 666;
final defaultTransition = ZoomPageTransitionsBuilder();

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

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return defaultTransition.buildTransitions(
        this, context, animation, secondaryAnimation, child);
  }
}

class CupertinoPageRouteEx<T> extends CupertinoPageRoute<T> {
  @override
  final Duration transitionDuration;

  CupertinoPageRouteEx({
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
