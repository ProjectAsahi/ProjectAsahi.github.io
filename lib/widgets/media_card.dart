import 'package:flutter/material.dart';
import 'package:projectasahi/widgets/platform_aware_asset_image.dart';
import 'package:url_launcher/url_launcher.dart';

class MediaCard extends StatelessWidget {
  final String icon;
  final String type;
  final String title;
  final String link;

  const MediaCard({Key key, this.icon, this.type, this.title, this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          if (await canLaunch(link)) {
            await launch(link);
          }
        },
        child: Container(
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: FittedBox(
                    child: icon.startsWith('http')
                        ? Image.network(icon)
                        : PlatformAwareAssetImage(
                            asset: icon,
                          ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    type,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
