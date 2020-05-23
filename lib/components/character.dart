import 'package:projectasahi/components/asset_image.dart';
import 'package:projectasahi/components/back_button.dart';
import 'package:projectasahi/components/fade_in.dart';
import 'package:projectasahi/components/slide_in.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:projectasahi/data/character_data.dart';
import 'package:projectasahi/extensions/iterable.dart';

final Character = (String name) => HookBuilder(builder: (context) {
      final mediaQuery = MediaQuery.of(context);
      final size = mediaQuery.size;
      final isMobile =
          size.width < 1024 || mediaQuery.orientation == Orientation.portrait;
      final colorBgSize = size.width / 4.5;
      final colorBgTranslateX =
          isMobile ? -size.width : colorBgSize - size.width;
      final isPoping = useState(false);
      final character =
          characters.firstWhere((element) => element.name_en == name);

      if (character == null) {
        return Center(
          child: Text(name + " not found"),
        );
      }

      final sub_visuals = character.sub_visuals
          .mapIndex(
            (value, index) => FadeIn(
              opacity: 0,
              translateY: 50,
              curves: Curves.easeOutExpo,
              delay: 4 + index.toDouble() / 4,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("/assets?name=" + Uri.encodeComponent(value));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: PlatformAwareAssetImage(
                    asset: value,
                  ),
                ),
              ),
            ),
          )
          .toList();

      final descs = [
        Text(
          character.name,
          style: TextStyle(
            color: character.text_color,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 50),
        FadeIn(
          delay: 3,
          opacity: 0,
          curves: Curves.easeOutExpo,
          translateX: 50,
          child: Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            children: character.extra_data.entries
                .map(
                  (e) => TableRow(
                    children: [
                      Text(
                        e.key,
                        style: TextStyle(color: character.text_color),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32),
                        child: Text(
                          e.value,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height: 50),
        FadeIn(
          child: Text(
            character.summary,
          ),
          delay: 4,
          opacity: 0,
          curves: Curves.easeOutExpo,
          translateX: 50,
        ),
        SizedBox(height: 50),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: sub_visuals,
        ),
      ];

      return WillPopScope(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              SlideIn(
                translateXTo: isPoping.value ? 0 : colorBgTranslateX,
                child: Container(
                  width: isPoping.value ? colorBgSize : size.width,
                  color: character.color,
                ),
              ),
              !isMobile
                  ? null
                  : Positioned(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: size.height * 0.87,
                                child: FadeIn(
                                  duration: 750,
                                  curves: Curves.easeOutExpo,
                                  delay: 2,
                                  opacity: 0,
                                  translateX: 50,
                                  child: PlatformAwareAssetImage(
                                    asset: character.main_visual,
                                  ),
                                ),
                              ),
                              ...descs
                            ],
                          ),
                        ),
                      ),
                    ),
              isMobile
                  ? null
                  : Positioned(
                      left: colorBgSize / 1.5,
                      top: 0,
                      bottom: 0,
                      child: FadeIn(
                        duration: 750,
                        curves: Curves.easeOutExpo,
                        delay: 2,
                        opacity: 0,
                        translateX: 100,
                        child: Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 30),
                          child: PlatformAwareAssetImage(
                            asset: character.main_visual,
                          ),
                        ),
                      ),
                    ),
              isMobile
                  ? null
                  : Positioned(
                      // left: colorBgSize + size.height / 4,
                      // right: colorBgSize,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 30,
                              bottom: 30,
                              left: colorBgSize + size.height / 4,
                              right: colorBgSize),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: descs,
                          ),
                        ),
                      ),
                    ),
              isMobile
                  ? null
                  : Positioned(
                      left: 0,
                      top: 0,
                      child: BackButtonEx(
                        onTap: () {
                          isPoping.value = true;
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
            ].where((element) => element != null).toList(),
          ),
        ),
        onWillPop: () async {
          isPoping.value = true;
          return true;
        },
      );
    });
