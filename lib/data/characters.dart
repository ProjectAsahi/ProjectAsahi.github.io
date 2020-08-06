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
  final List<RelationshipData> relationship;

  CharacterData({
    this.id,
    this.name,
    this.nameEn,
    this.mainVisual,
    this.color,
    this.intro,
    this.summary,
    this.extraData,
    this.mainVisualAlignment = Alignment.center,
    this.avatarOffsetX = 0,
    this.rightPadding = 0,
    this.relationship = const [],
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
      )
    ],
  ),
  CharacterData(
    name: 'Tesla',
    id: 'Tesla',
    nameEn: 'Tesla',
    mainVisual: 'Tesla/main_visual.webp',
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
  ),
  CharacterData(
    name: '秋',
    id: 'Aki',
    nameEn: 'Aki',
    mainVisual: 'Aki/main_visual.webp',
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
  ),
  CharacterData(
    name: '翼',
    id: 'Yi',
    nameEn: 'Yi',
    mainVisual: 'Yi/main_visual.webp',
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
  ),
];
