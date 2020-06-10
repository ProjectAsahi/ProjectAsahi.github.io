import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projectasahi/generated/codegen_loader.g.dart';

class CharacterData {
  final String name;
  final String name_en;
  final String name_ori;
  final Color color;
  final Color text_color;
  final bool enabled;
  final String intro;
  final String summary;
  final Map<String, String> extra_data;
  final String main_visual;
  final List<String> sub_visuals;

  const CharacterData( 
      {this.name = "",
      this.name_ori = "",
      this.name_en = "",
      this.intro = "",
      this.text_color = Colors.black,
      this.color = Colors.white,
      this.enabled = true,
      this.summary = "",
      this.extra_data,
      this.main_visual = "",
      this.sub_visuals});
}

const _male = "♂";
const _futanari = "⚥";
const _female = "♀";
const _transgender = "⚦";

const characters = [
  CharacterData(
    name: LocaleKeys.characters_asahi_name_localized,
    name_ori: "高垣朝陽",
    name_en: "Asahi",
    intro: LocaleKeys.characters_asahi_intro,
    summary: LocaleKeys.characters_asahi_summary,
    extra_data: {
      LocaleKeys.gender: _male,
      LocaleKeys.age: LocaleKeys.characters_asahi_age,
      LocaleKeys.birthday: LocaleKeys.characters_asahi_birthday,
      LocaleKeys.height: LocaleKeys.characters_asahi_height,
      LocaleKeys.hobby: LocaleKeys.characters_asahi_hobby,
      LocaleKeys.favourite_food: LocaleKeys.characters_asahi_favourite_food,
      LocaleKeys.favourite_animal: LocaleKeys.characters_asahi_favourite_animal,
    },
    main_visual: 'asahi/main_visual.webp',
    sub_visuals: [
      "asahi/avatar_3d.webp",
      "asahi/gamming.webp",
      "asahi/live.webp",
      "asahi/swimming.webp"
    ],
    color: Colors.greenAccent,
    text_color: Colors.green,
  ),
  CharacterData(
    name_en: "Aki",
    name_ori: "秋",
    extra_data: {
      LocaleKeys.gender: _female,
    },
    enabled: false,
    main_visual: 'aki/cut.webp',
    color: Colors.blueAccent,
  ),
  CharacterData(
    name_en: "Tesla",
    name_ori: "Tesla",
    extra_data: {
      LocaleKeys.gender: _futanari,
    },
    enabled: false,
    main_visual: "tesla/main_visual.webp",
    color: Colors.purpleAccent,
  ),
  CharacterData(
    name_en: "Yi",
    name_ori: "翼",
    extra_data: {
      LocaleKeys.gender: _male,
    },
    enabled: false,
    main_visual: "placeholder.webp",
    color: Colors.redAccent,
  ),
];
