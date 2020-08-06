import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:projectasahi/data/characters.dart';
import 'package:projectasahi/utils/optionalExpanded.dart';
import 'package:projectasahi/widgets/platform_aware_asset_image.dart';
import 'package:projectasahi/widgets/row_or_column.dart';

class CharacterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Container(
      height: query.size.height * 0.75,
      child: RowOrPageView(
        children: characters
            .map(
              (e) => _CharacterItem(
                visual: e.mainVisual,
                title: e.name,
                color: e.color,
                id: e.id,
                alignment: e.mainVisualAlignment,
              ),
            )
            .map((e) => optionalExpanded(context, e))
            .toList(),
      ),
    );
  }
}

class _CharacterItem extends StatefulWidget {
  final String visual;
  final Alignment alignment;
  final Color color;
  final String title;
  final String id;

  const _CharacterItem({
    Key key,
    this.visual,
    this.alignment = Alignment.center,
    this.color,
    this.title,
    this.id,
  }) : super(key: key);
  @override
  __CharacterItemState createState() => __CharacterItemState();
}

class __CharacterItemState extends State<_CharacterItem> {
  bool isPointerOver = false;
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/character/' + widget.id);
        },
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              isPointerOver = true;
            });
          },
          onExit: (event) {
            setState(() {
              isPointerOver = false;
            });
          },
          onHover: (event) {},
          cursor: SystemMouseCursors.click,
          child: Stack(
            children: [
              Center(
                child: AnimatedContainer(
                  curve: Curves.easeOutCubic,
                  duration: Duration(milliseconds: 333),
                  alignment: FractionalOffset.center,
                  transform: Matrix4Transform()
                      .scale(isPointerOver ? 1.1 : 1.0,
                          origin: Offset(
                              query.size.width > 480
                                  ? min(query.size.width, 1280) / 4 / 2
                                  : 480 / 2,
                              query.size.height * 0.75 / 2))
                      .matrix4,
                  child: Hero(
                    tag: 'avatar_main_visual_' + widget.id,
                    child: PlatformAwareAssetImage(
                      height: query.size.height * 0.75,
                      fit: BoxFit.cover,
                      asset: widget.visual,
                      alignment: widget.alignment,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: query.size.height * 0.75 * 0.3,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 333),
                  decoration: BoxDecoration(),
                  curve: Curves.easeOutCubic,
                  transform: Matrix4.identity()
                    ..translate(0.0, (isPointerOver ? 0 : 100).toDouble()),
                  child: AnimatedOpacity(
                    curve: Curves.easeOutCubic,
                    opacity: isPointerOver ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 333),
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: widget.color,
                      child: Text(
                        widget.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
