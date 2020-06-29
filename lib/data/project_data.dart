import 'package:flutter/widgets.dart';
import 'package:projectasahi/extensions/hex_color.dart';

class ProjectData {
  final PersonData producer;
  final List<PersonData> artists;
  final PersonData assitant;

  ProjectData({this.producer, this.artists, this.assitant});
}

class PersonData {
  final String name;
  final String link;
  final Color color;

  PersonData({this.color, this.name, this.link = ""});
}
final accentColor = HexColor.fromHex("#ff4081");
final primaryColor = HexColor.fromHex("#0080ff");
final projectData = ProjectData(
  producer: PersonData(
    color: primaryColor,
    name: "Tlaster",
  ),
  artists: [
    PersonData(
      color: accentColor,
      name: "-salz-",
      link: "https://www.pixiv.net/users/1788244",
    ),
  ],
  assitant: PersonData(
    color: primaryColor,
    name: "零火",
    link: "https://weibo.com/zeroblaze",
  ),
);
