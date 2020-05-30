import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:projectasahi/components/about.dart';
import 'package:projectasahi/components/character.dart';
import 'package:projectasahi/components/home.dart';
import 'package:projectasahi/components/image_dialog.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  Router router = new Router();
  router.define("/character/:id", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Character(params["id"][0]);
  }), transitionType: TransitionType.cupertino);
  router.define("/assets", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ImageDialog(
      name: Uri.decodeComponent(params["name"]?.first),
    );
  }), transitionType: TransitionType.fadeIn);
  router.define("/about", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return About();
  }), transitionType: TransitionType.cupertinoFullScreenDialog);
  router.define('/', handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Home();
  }), transitionType: TransitionType.fadeIn);
  return router.generator(settings);
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
