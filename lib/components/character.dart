import 'package:projectasahi/components/fade_in.dart';
import 'package:projectasahi/components/slide_in.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:projectasahi/data/character_data.dart';
import 'package:projectasahi/extensions/iterable.dart';

final Character = (String name) => HookBuilder(builder: (context) {
      final size = MediaQuery.of(context).size;
      final colorBgSize = size.width / 4.5;
      final colorBgTranslateX = colorBgSize - size.width;
      final isPoping = useState(false);
      final character =
          characters.firstWhere((element) => element.name_en == name);

      if (character == null) {
        return Center(
          child: Text(name + " not found"),
        );
      }
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
              Positioned(
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
                    child: Image(
                      image: AssetImage(character.main_visual),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: colorBgSize + size.height / 4,
                right: colorBgSize,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          character.name,
                          textScaleFactor: 4,
                          style: TextStyle(color: character.color),
                        ),
                        // Spacer(),
                        SizedBox(height: 50),
                        FadeIn(
                          delay: 3,
                          opacity: 0,
                          curves: Curves.easeOutExpo,
                          translateX: 50,
                          child: Table(
                            defaultColumnWidth: IntrinsicColumnWidth(),
                            children: character.extra_data.entries
                                .map((e) => TableRow(children: [
                                      Text(
                                        e.key,
                                        textScaleFactor: 1.25,
                                        style:
                                            TextStyle(color: character.color),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 32),
                                        child: Text(
                                          e.value,
                                          textScaleFactor: 1.25,
                                        ),
                                      ),
                                    ]))
                                .toList(),
                          ),
                        ),
                        SizedBox(height: 50),
                        FadeIn(
                          child: Text(
                            character.summary,
                            textScaleFactor: 1.25,
                          ),
                          delay: 4,
                          opacity: 0,
                          curves: Curves.easeOutExpo,
                          translateX: 50,
                        ),
                        SizedBox(height: 50),
                        Flex(
                          direction: Axis.horizontal,
                          children: character.sub_visuals
                              .mapIndex(
                                (value, index) => Expanded(
                                  child: FadeIn(
                                    opacity: 0,
                                    translateY: 50,
                                    curves: Curves.easeOutExpo,
                                    delay: 4 + index.toDouble() / 4,
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Image(
                                          image: AssetImage(value),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onWillPop: () async {
          isPoping.value = true;
          return true;
        },
      );
    });
