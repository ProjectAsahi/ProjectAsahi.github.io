import 'package:flutter/widgets.dart';
import 'package:projectasahi/components/MaterialPageRouteEx.dart';
import 'package:projectasahi/components/about.dart';
import 'package:projectasahi/components/character.dart';
import 'package:projectasahi/components/home.dart';
import 'package:projectasahi/components/image_dialog.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.name.startsWith("/character")) {
    return CupertinoPageRouteEx(
      builder: (_) => Character(settings.name.split('/')[2]),
      settings: settings,
    );
  } else if (settings.name.startsWith("/assets")) {
    return CupertinoPageRouteEx(
      builder: (_) => ImageDialog(
        name: Uri.decodeComponent(settings.name.split('/')[2]),
      ),
      settings: settings,
      fullscreenDialog: true,
      transitionsBuilder: FadePageTransitionsBuilder(),
    );
  } else if (settings.name.startsWith('/about')) {
    return CupertinoPageRouteEx(
      builder: (_) => About(),
      settings: settings,
      fullscreenDialog: true,
    );
  } else {
    return CupertinoPageRouteEx(
      builder: (_) => Home(),
      settings: settings,
    );
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

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({this.exitPage, this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(new CurvedAnimation(
                    parent: animation, curve: Curves.easeInOutCirc)),
                child: exitPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(new CurvedAnimation(
                    parent: animation, curve: Curves.easeInOutCirc)),
                child: enterPage,
              )
            ],
          ),
        );
}
