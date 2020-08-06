import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  ),
  CharacterData(
    name: 'Tesla',
    id: 'Tesla',
    nameEn: 'Tesla',
    mainVisual: 'Tesla/main_visual.webp',
    color: Colors.purple,
    avatarOffsetX: -0.2,
    rightPadding: 0.09,
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
  ),
  CharacterData(
    name: '秋',
    id: 'Aki',
    nameEn: 'Aki',
    mainVisual: 'Aki/main_visual.webp',
    color: Colors.blue,
    avatarOffsetX: -0.2,
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
  ),
];
