import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RelationshipData {
  final String title;
  final List<RelationshipWithCharacter> items;

  RelationshipData({this.title, this.items});
}

class RelationshipWithCharacter {
  final String id;
  final List<RelationshipItem> items;

  RelationshipWithCharacter({this.id, this.items});
}

class RelationshipItem {
  final String desc;
  final bool isPositive;
  final int point;

  RelationshipItem({this.desc, this.isPositive, this.point});
}

class Gallery {
  final String value;
  final String title;
  final String desc;
  final String artist;
  final String artistLink;

  Gallery({
    this.value,
    this.title,
    this.desc,
    this.artist,
    this.artistLink,
  });
}

class CharacterData {
  final String id;
  final String name;
  final String nameEn;
  final String mainVisual;
  final Color color;
  final String intro;
  final String summary;
  final Map<String, String> extraData;
  final Alignment mainVisualAlignment;
  final double avatarOffsetX;
  final double rightPadding;
  final String icon;
  final List<RelationshipData> relationship;
  final List<Gallery> gallery;

  CharacterData({
    this.id,
    this.name,
    this.nameEn,
    this.mainVisual,
    this.color,
    this.intro,
    this.summary,
    this.extraData,
    this.icon,
    this.mainVisualAlignment = Alignment.center,
    this.avatarOffsetX = 0,
    this.rightPadding = 0,
    this.relationship = const [],
    this.gallery = const [],
  });
}

const _male = "♂";
const _futanari = "⚥";
const _female = "♀";
const _transgender = "⚦";
const _genderless = '∅';

final characters = [
  CharacterData(
    name: '高垣朝陽',
    nameEn: 'Asahi Takagaki',
    id: 'Asahi',
    mainVisual: 'Asahi/main_visual.webp',
    icon: 'Asahi/icon.jpg',
    color: Colors.teal,
    avatarOffsetX: -0.05,
    rightPadding: 0.075,
    intro: 'characters.asahi.intro',
    summary: 'characters.asahi.summary',
    extraData: {
      'gender': _male,
      'age': 'characters.asahi.age',
      'birthday': 'characters.asahi.birthday',
      'height': 'characters.asahi.height',
      'hobby': 'characters.asahi.hobby',
      'favourite.food': 'characters.asahi.favourite.food',
      'favourite.animal': 'characters.asahi.favourite.animal',
    },
    gallery: [
      Gallery(
        value: 'Asahi/live.webp',
        title: "characters.asahi.gallery.live.title",
        desc: "characters.asahi.gallery.live.desc",
        artist: '-salz-',
        artistLink: 'https://www.pixiv.net/users/1788244',
      ),
      Gallery(
        value: 'Asahi/gamming.webp',
        title: "characters.asahi.gallery.gamming.title",
        desc: "characters.asahi.gallery.gamming.desc",
        artist: '-salz-',
        artistLink: 'https://www.pixiv.net/users/1788244',
      ),
      Gallery(
        value: 'Asahi/cookie.webp',
        title: "characters.asahi.gallery.cookie.title",
        desc: "characters.asahi.gallery.cookie.desc",
        artist: '-salz-',
        artistLink: 'https://www.pixiv.net/users/1788244',
      ),
      Gallery(
        value: 'Asahi/swimming.webp',
        title: "characters.asahi.gallery.swimming.title",
        desc: "characters.asahi.gallery.swimming.desc",
        artist: '-salz-',
        artistLink: 'https://www.pixiv.net/users/1788244',
      ),
      Gallery(
        value: 'crepe.webp',
        title: "characters.asahi.gallery.crepe.title",
        desc: "characters.asahi.gallery.crepe.desc",
        artist: 'saintbernard',
      ),
      Gallery(
        value: 'sea.webp',
        title: "characters.asahi.gallery.sea.title",
        desc: "characters.asahi.gallery.sea.desc",
        artist: 'saintbernard',
      ),
      Gallery(
        value: 'Asahi/avatar_3d.webp',
        title: "characters.asahi.gallery.avatar_3d.title",
        desc: "characters.asahi.gallery.avatar_3d.desc",
      ),
      Gallery(
        value: 'Asahi/cooking.webp',
        title: "characters.asahi.gallery.cooking.title",
        desc: "characters.asahi.gallery.cooking.desc",
        artist: 'にま',
        artistLink: 'https://www.pixiv.net/users/9790932',
      ),
    ],
    relationship: [
      RelationshipData(
        title: 'family',
        items: [
          RelationshipWithCharacter(
            id: 'Tesla',
            items: [
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.asahi.relationship.tesla.positive01",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.asahi.relationship.tesla.positive02",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.asahi.relationship.tesla.positive03",
              ),
            ],
          ),
          RelationshipWithCharacter(
            id: 'Yi',
            items: [
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.asahi.relationship.yi.positive01",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.asahi.relationship.yi.positive02",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.asahi.relationship.yi.positive03",
              ),
            ],
          ),
        ],
      ),
      RelationshipData(
        title: "cafe",
        items: [
          RelationshipWithCharacter(
            id: 'Aki',
            items: [
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.asahi.relationship.aki.positive01",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.asahi.relationship.aki.positive02",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.asahi.relationship.aki.positive03",
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  CharacterData(
    name: 'Tesla',
    id: 'Tesla',
    nameEn: 'Tesla',
    mainVisual: 'Tesla/main_visual.webp',
    icon: 'Tesla/icon.png',
    color: Colors.purple,
    avatarOffsetX: -0.2,
    rightPadding: 0.09,
    intro: 'characters.tesla.intro',
    summary: 'characters.tesla.summary',
    extraData: {
      'gender': _futanari,
      'age': 'characters.tesla.age',
      'birthday': 'characters.tesla.birthday',
      'height': 'characters.tesla.height',
      'hobby': 'characters.tesla.hobby',
      'favourite.food': 'characters.tesla.favourite.food',
    },
    gallery: [
      Gallery(
        value: 'Tesla/icon_1.webp',
        title: "characters.tesla.gallery.icon_1.title",
        desc: "characters.tesla.gallery.icon_1.desc",
        artist: '坂月',
      ),
      Gallery(
        value: 'Tesla/icon_2.webp',
        title: "characters.tesla.gallery.icon_2.title",
        desc: "characters.tesla.gallery.icon_2.desc",
        artist: '坂月',
      ),
      Gallery(
        value: 'Tesla/icon_3.webp',
        title: "characters.tesla.gallery.icon_3.title",
        desc: "characters.tesla.gallery.icon_3.desc",
        artist: '坂月',
      ),
      Gallery(
        value: 'Tesla/yuki.webp',
        title: "characters.tesla.gallery.yuki.title",
        desc: "characters.tesla.gallery.yuki.desc",
        artist: 'chilcy',
        artistLink: 'https://www.pixiv.net/users/34847027',
      ),
      Gallery(
        value: 'crepe.webp',
        title: "characters.asahi.gallery.crepe.title",
        desc: "characters.asahi.gallery.crepe.desc",
        artist: 'saintbernard',
      ),
      Gallery(
        value: 'sea.webp',
        title: "characters.asahi.gallery.sea.title",
        desc: "characters.asahi.gallery.sea.desc",
        artist: 'saintbernard',
      ),
    ],
    relationship: [
      RelationshipData(
        title: 'family',
        items: [
          RelationshipWithCharacter(
            id: 'Asahi',
            items: [
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.tesla.relationship.asahi.positive01",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.tesla.relationship.asahi.positive02",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.tesla.relationship.asahi.positive03",
              ),
            ],
          ),
          RelationshipWithCharacter(
            id: 'Yi',
            items: [
              RelationshipItem(
                isPositive: true,
                point: 50,
                desc: "characters.tesla.relationship.yi.positive01",
              ),
              RelationshipItem(
                isPositive: true,
                point: 50,
                desc: "characters.tesla.relationship.yi.positive02",
              ),
            ],
          ),
        ],
      ),
      RelationshipData(
        title: "cafe",
        items: [
          RelationshipWithCharacter(
            id: 'Aki',
            items: [
              RelationshipItem(
                isPositive: false,
                point: 100,
                desc: "characters.tesla.relationship.aki.negative01",
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  CharacterData(
    name: '秋',
    id: 'Aki',
    nameEn: 'Aki',
    mainVisual: 'Aki/main_visual.webp',
    icon: 'Aki/icon.png',
    color: Colors.blue,
    avatarOffsetX: -0.2,
    rightPadding: 0.075,
    intro: 'characters.aki.intro',
    summary: 'characters.aki.summary',
    extraData: {
      'gender': _female,
      'age': 'characters.aki.age',
      'birthday': 'characters.aki.birthday',
      'height': 'characters.aki.height',
      'hobby': 'characters.aki.hobby',
      'favourite.cocktails': 'characters.aki.favourite.cocktails',
    },
    gallery: [
      Gallery(
        value: 'Aki/working.webp',
        title: "characters.aki.gallery.working.title",
        desc: "characters.aki.gallery.working.desc",
        artist: '-salz-',
        artistLink: 'https://www.pixiv.net/users/1788244',
      ),
      Gallery(
        value: 'Aki/pandorahearts.webp',
        title: "characters.aki.gallery.pandorahearts.title",
        desc: "characters.aki.gallery.pandorahearts.desc",
        artist: '辻本嗣',
        artistLink: 'https://www.pixiv.net/users/7170645',
      ),
      Gallery(
        value: 'Aki/bar.png',
        title: "characters.aki.gallery.bar.title",
        desc: "characters.aki.gallery.bar.desc",
        artist: 'よくに',
        artistLink: 'https://www.pixiv.net/users/14066606',
      ),
    ],
    relationship: [
      RelationshipData(
        title: "cafe",
        items: [
          RelationshipWithCharacter(
            id: 'Asahi',
            items: [
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.aki.relationship.asahi.positive01",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.aki.relationship.asahi.positive02",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.aki.relationship.asahi.positive03",
              ),
            ],
          ),
        ],
      ),
      RelationshipData(
        title: 'future_family',
        items: [
          RelationshipWithCharacter(
            id: 'Tesla',
            items: [
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.aki.relationship.tesla.positive01",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.aki.relationship.tesla.positive02",
              ),
              RelationshipItem(
                isPositive: false,
                point: 50,
                desc: "characters.aki.relationship.tesla.negative01",
              ),
            ],
          ),
          RelationshipWithCharacter(
            id: 'Yi',
            items: [
              RelationshipItem(
                isPositive: true,
                point: 50,
                desc: "characters.aki.relationship.yi.positive01",
              ),
              RelationshipItem(
                isPositive: true,
                point: 50,
                desc: "characters.aki.relationship.yi.positive02",
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  CharacterData(
    name: '翼',
    id: 'Yi',
    nameEn: 'Yi',
    mainVisual: 'Yi/main_visual.webp',
    icon: 'Yi/icon.webp',
    mainVisualAlignment: Alignment.centerLeft,
    color: Colors.pink,
    avatarOffsetX: -0.1,
    rightPadding: 0.2,
    intro: 'characters.yi.intro',
    summary: 'characters.yi.summary',
    extraData: {
      'gender': _genderless,
      'age': 'characters.yi.age',
      'birthday': 'characters.yi.birthday',
      'height': 'characters.yi.height',
      'hobby': 'characters.yi.hobby',
      'favourite.drink': 'characters.yi.favourite.drink',
      'favourite.bang': 'characters.yi.favourite.bang',
    },
    gallery: [
      Gallery(
        value: 'Yi/boy.webp',
        title: "characters.yi.gallery.boy.title",
        desc: "characters.yi.gallery.boy.desc",
        artist: '坂月',
      ),
      Gallery(
        value: 'Yi/girl.webp',
        title: "characters.yi.gallery.girl.title",
        desc: "characters.yi.gallery.girl.desc",
        artist: '坂月',
      ),
      Gallery(
        value: 'Yi/chibi.png',
        title: "characters.yi.gallery.chibi.title",
        desc: "characters.yi.gallery.chibi.desc",
        artist: 'EU03',
        artistLink: 'https://www.pixiv.net/users/226500',
      ),
    ],
    relationship: [
      RelationshipData(
        title: 'family',
        items: [
          RelationshipWithCharacter(
            id: 'Asahi',
            items: [
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.yi.relationship.asahi.positive01",
              ),
              RelationshipItem(
                isPositive: true,
                point: 50,
                desc: "characters.yi.relationship.asahi.positive02",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.yi.relationship.asahi.positive03",
              ),
            ],
          ),
          RelationshipWithCharacter(
            id: 'Tesla',
            items: [
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.yi.relationship.tesla.positive01",
              ),
              RelationshipItem(
                isPositive: true,
                point: 50,
                desc: "characters.yi.relationship.tesla.positive02",
              ),
            ],
          ),
        ],
      ),
      RelationshipData(
        title: "cafe",
        items: [
          RelationshipWithCharacter(
            id: 'Aki',
            items: [
              RelationshipItem(
                isPositive: true,
                point: 50,
                desc: "characters.yi.relationship.aki.positive01",
              ),
              RelationshipItem(
                isPositive: true,
                point: 100,
                desc: "characters.yi.relationship.aki.positive02",
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
