import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailArguments {
  final String name;

  DetailArguments(this.name);
}

final Detail = ({String name}) => HookBuilder(builder: (context) {
      return Stack(
        children: [
          Hero(
            tag: 'characterImage',
            child: Image.asset('avatar.webp'),
          )
        ],
      );
    });
