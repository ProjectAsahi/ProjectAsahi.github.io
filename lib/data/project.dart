import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

final accentColor = Colors.pinkAccent;
final primaryColor = Colors.blue;
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
    PersonData(
      color: primaryColor,
      name: "坂月",
    ),
    PersonData(
      color: accentColor,
      name: "嗨P",
    ),
    PersonData(
      color: primaryColor,
      name: "EU03",
      link: "https://www.pixiv.net/users/226500",
    ),
    PersonData(
      color: accentColor,
      name: "saintbernard",
    ),
    PersonData(
      color: accentColor,
      name: "chilcy",
      link: "https://www.pixiv.net/users/34847027",
    ),
    PersonData(
      color: accentColor,
      name: "辻本嗣",
      link: "https://www.pixiv.net/users/7170645",
    ),
    PersonData(
      color: accentColor,
      name: "よくに",
      link: "https://www.pixiv.net/users/14066606",
    ),
    PersonData(
      color: accentColor,
      name: "にま",
      link: "https://www.pixiv.net/users/9790932",
    ),
  ],
  assitant: PersonData(
    color: primaryColor,
    name: "零火",
    link: "https://weibo.com/zeroblaze",
  ),
);
