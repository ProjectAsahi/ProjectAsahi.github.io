import 'package:flutter/widgets.dart';

import 'components/home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return _getPageRoute(Home(), settings);
    // case HomeRoute:
    //   return _getPageRoute(HomeView(), settings);
    // case AboutRoute:
    //   return _getPageRoute(AboutView(), settings);
    // case EpisodesRoute:
    //   return _getPageRoute(EpisodesView(), settings);
    // case EpisodeDetailsRoute:
    //   return _getPageRoute(EpisodeDetails(), settings);
    // default:
    //   return _getPageRoute(HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
