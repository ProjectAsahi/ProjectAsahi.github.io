import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';
import 'package:projectasahi/data/characters.dart';
import 'package:projectasahi/utils/standard_padding.dart';
import 'package:projectasahi/widgets/fade_in.dart';
import 'package:projectasahi/widgets/platform_aware_asset_image.dart';

class ImageDialog extends StatefulWidget {
  final String characterId;
  final String galleryAssetName;

  const ImageDialog({
    Key key,
    this.characterId,
    this.galleryAssetName,
  }) : super(key: key);

  @override
  _ImageDialogState createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  Offset offset = Offset(kToolbarHeight, kToolbarHeight);

  Offset _calOffset(
      Size size, Offset offset, Offset nextOffset, double maxWidth) {
    double dx = 0;
    if (offset.dx + nextOffset.dx + maxWidth - 50 <= 0) {
      dx = -maxWidth + 50;
    } else if (offset.dx + nextOffset.dx >= (size.width - 50)) {
      dx = size.width - 50;
    } else {
      dx = offset.dx + nextOffset.dx;
    }
    double dy = 0;
    if (offset.dy + nextOffset.dy >= (size.height - 100)) {
      dy = size.height - 100;
    } else if (offset.dy + nextOffset.dy <= 0) {
      dy = 0;
    } else {
      dy = offset.dy + nextOffset.dy;
    }
    return Offset(
      dx,
      dy,
    );
  }

  @override
  Widget build(BuildContext context) {
    final character =
        characters.firstWhere((element) => element.id == widget.characterId);
    final data = character?.gallery
        ?.firstWhere((element) => element.value == widget.galleryAssetName);
    if (data == null) {
      return Center(child: Text('404'));
    }
    final standardPadding = calcStandardPadding(context);
    final query = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PhotoView.customChild(
              backgroundDecoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Hero(
                tag: '${widget.characterId}/${widget.galleryAssetName}',
                child: PlatformAwareAssetImage(
                  asset: data.value,
                ),
              ),
            ),
          ),
          Positioned(
            left: offset.dx,
            top: offset.dy,
            child: FadeIn(
              delay: 2.5,
              translateY: 100,
              child: Card(
                elevation: 4,
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: min(query.size.width * 0.3, 300)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.move,
                        child: GestureDetector(
                          onPanUpdate: (detail) {
                            setState(() {
                              offset = _calOffset(
                                MediaQuery.of(context).size,
                                offset,
                                detail.delta,
                                min(query.size.width * 0.3, 300),
                              );
                            });
                          },
                          onPanEnd: (detail) {},
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            color: character.color,
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    tr(data.title),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Icon(
                                    Icons.control_camera,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          tr(data.desc),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: standardPadding,
            top: standardPadding / 2,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).buttonColor,
              foregroundColor: Theme.of(context).textTheme.bodyText1.color,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
