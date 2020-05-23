import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projectasahi/components/back_button.dart';
import 'package:projectasahi/components/fade_in.dart';
import 'package:projectasahi/extensions/iterable.dart';
import 'package:projectasahi/data/project_data.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          BackButtonEx(
            color: accentColor,
            iconColor: Colors.white,
            onTap: () => Navigator.of(context).pop(),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(60),
              child: Container(
                width: min(size.width, 768),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('projectasahi_logo.webp'),
                    SizedBox(height: 50),
                    FadeIn(
                      delay: 1,
                      opacity: 0,
                      curves: Curves.easeOutExpo,
                      translateY: 50,
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        defaultColumnWidth: IntrinsicColumnWidth(),
                        children: [
                          TableRow(
                            children: [
                              Text(
                                "企划",
                              ),
                              FlatButton(
                                textColor: projectData.producer.color,
                                onPressed: () {},
                                child: Text(projectData.producer.name),
                              ),
                            ],
                          ),
                          ...projectData.artists.mapIndex(
                            (value, index) => TableRow(
                              children: [
                                Text(
                                  index == 0 ? "原画" : "",
                                ),
                                FlatButton(
                                  textColor: value.color,
                                  onPressed: () {
                                    launch(value.link);
                                  },
                                  child: Text(
                                    value.name,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TableRow(
                            children: [
                              Text(
                                "企划协力",
                              ),
                              FlatButton(
                                textColor: projectData.assitant.color,
                                onPressed: () {
                                  launch(projectData.assitant.link);
                                },
                                child: Text(
                                  projectData.assitant.name,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
