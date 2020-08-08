import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:projectasahi/data/project.dart';
import 'package:projectasahi/utils/standard_padding.dart';
import 'package:projectasahi/widgets/app_bar.dart';
import 'package:projectasahi/widgets/fade_in.dart';
import 'package:projectasahi/widgets/top_menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectasahi/utils/iterable.dart';

class AboutScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final standardPadding = calcStandardPadding(context);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      endDrawer: AppDrawer(),
      body: Stack(
        children: [
          Positioned(
            top: standardPadding,
            left: standardPadding * 2,
            right: standardPadding * 2,
            child: AppBarWidget(),
          ),
          Center(
            child: FadeIn(
              delay: 1,
              opacity: 0,
              curves: Curves.easeOutExpo,
              translateY: 50,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                defaultColumnWidth: IntrinsicColumnWidth(),
                children: [
                  TableRow(
                    children: [
                      Text(
                        tr('producer'),
                      ),
                      FlatButton(
                        textColor: projectData.producer.color,
                        onPressed: () {},
                        child: Text(
                          projectData.producer.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        tr('project_assistant'),
                      ),
                      FlatButton(
                        textColor: projectData.assitant.color,
                        onPressed: () {
                          launch(projectData.assitant.link);
                        },
                        child: Text(
                          projectData.assitant.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  ...projectData.artists.mapIndex(
                    (value, index) => TableRow(
                      children: [
                        Text(
                          index == 0 ? tr('artist') : "",
                        ),
                        FlatButton(
                          textColor: value.color,
                          onPressed: () {
                            if (value.link.isNotEmpty) {
                              launch(value.link);
                            }
                          },
                          child: Text(
                            value.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
