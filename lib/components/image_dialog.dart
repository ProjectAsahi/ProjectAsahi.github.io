import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:projectasahi/components/back_button.dart';
import 'package:projectasahi/data/project_data.dart';

class ImageDialog extends StatelessWidget {
  final String name;

  const ImageDialog({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final isMobile =
        size.width < 1024 || mediaQuery.orientation == Orientation.portrait;
    return Stack(
      children: [
        Positioned.fill(
          child: PhotoView(
            backgroundDecoration: BoxDecoration(
              color: Colors.white,
            ),
            imageProvider: AssetImage(name),
          ),
        ),
        isMobile
            ? null
            : Positioned(
                left: 0,
                top: 0,
                child: BackButtonEx(
                  color: accentColor,
                  iconColor: Colors.white,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
      ].where((element) => element != null).toList(),
    );
  }
}
