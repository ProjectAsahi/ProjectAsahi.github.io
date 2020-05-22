import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

final Character = (String name) => HookBuilder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Text(name),
            Hero(
              tag: 'chimg',
              child: Image(
                image: AssetImage('avatar.webp'),
              ),
            ),
          ],
        ),
      );
    });
