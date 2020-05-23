import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CharacterData {
  final String name;
  final String name_en;
  final String name_ori;
  final Color color;
  final Color text_color;
  final bool enabled;
  final String gender;
  final String intro;
  final String summary;
  final String birthday;
  final Map<String, String> extra_data;
  final String main_visual;
  final List<String> sub_visuals;

  const CharacterData(
      {this.name = "",
      this.name_ori = "",
      this.name_en = "",
      this.gender = "",
      this.intro = "",
      this.text_color = Colors.black,
      this.color = Colors.white,
      this.enabled = true,
      this.summary = "",
      this.birthday = "",
      this.extra_data,
      this.main_visual = "",
      this.sub_visuals});
}

const characters = [
  CharacterData(
    name: "高垣朝陽",
    name_ori: "高垣朝陽",
    name_en: "Asahi",
    gender: "♂",
    intro: "我叫朝陽，高垣朝陽\n是男孩子噢！",
    summary:
        "喜欢穿水手服的阳光少女，可是真实身份却是男孩子，只因为喜欢可爱的衣服而穿上了女装。头发是真发而且发质非常好，对自己的单马尾非常自信。出于服装可爱的理由在一所女仆咖啡厅打工，在店里很受欢迎。\n似乎很喜欢一个游戏里叫朝日的角色。",
    birthday: "7月10日",
    main_visual: "asahi/main_visual.webp",
    extra_data: {
      "性别": "♂",
      "生日": "7月10日",
      "喜欢的食物": "马卡龙和其他甜食！",
      "喜欢的动物": "小熊、猫猫！",
      "兴趣": "女仆咖啡厅的打工",
    },
    sub_visuals: [
      "asahi/avatar_3d.webp",
      "asahi/gamming.webp",
      "asahi/live.webp",
      "asahi/swimming.webp",
    ],
    color: Colors.greenAccent,
    text_color: Colors.green,
  ),
  CharacterData(
    name: "高垣朝陽",
    name_ori: "高垣朝陽",
    enabled: false,
    name_en: "Aki",
    gender: "♂",
    intro: "我叫朝陽，高垣朝陽\n是男孩子噢！",
    summary:
        "喜欢穿水手服的阳光少女，可是真实身份却是男孩子，只因为喜欢可爱的衣服而穿上了女装。头发是真发而且发质非常好，对自己的单马尾非常自信。出于服装可爱的理由在一所女仆咖啡厅打工，在店里很受欢迎。\n似乎很喜欢一个游戏里叫朝日的角色。",
    birthday: "7月10日",
    main_visual: "placeholder.webp",
    extra_data: {
      "性别": "♂",
      "生日": "7月10日",
      "喜欢的食物": "马卡龙和其他甜食！",
      "喜欢的动物": "小熊、猫猫！",
      "兴趣": "女仆咖啡厅的打工",
    },
    sub_visuals: [
      "asahi/avatar_3d.webp",
      "asahi/gamming.webp",
      "asahi/live.webp",
      "asahi/swimming.webp",
    ],
    color: Colors.blueAccent,
  ),
  CharacterData(
    name: "高垣朝陽",
    name_ori: "高垣朝陽",
    name_en: "Tesla",
    enabled: false,
    gender: "♂",
    intro: "我叫朝陽，高垣朝陽\n是男孩子噢！",
    summary:
        "喜欢穿水手服的阳光少女，可是真实身份却是男孩子，只因为喜欢可爱的衣服而穿上了女装。头发是真发而且发质非常好，对自己的单马尾非常自信。出于服装可爱的理由在一所女仆咖啡厅打工，在店里很受欢迎。\n似乎很喜欢一个游戏里叫朝日的角色。",
    birthday: "7月10日",
    main_visual: "placeholder.webp",
    extra_data: {
      "性别": "♂",
      "生日": "7月10日",
      "喜欢的食物": "马卡龙和其他甜食！",
      "喜欢的动物": "小熊、猫猫！",
      "兴趣": "女仆咖啡厅的打工",
    },
    sub_visuals: [
      "asahi/avatar_3d.webp",
      "asahi/gamming.webp",
      "asahi/live.webp",
      "asahi/swimming.webp",
    ],
    color: Colors.purpleAccent,
  ),
  CharacterData(
    name: "高垣朝陽",
    name_ori: "高垣朝陽",
    enabled: false,
    name_en: "Wind",
    gender: "♂",
    intro: "我叫朝陽，高垣朝陽\n是男孩子噢！",
    summary:
        "喜欢穿水手服的阳光少女，可是真实身份却是男孩子，只因为喜欢可爱的衣服而穿上了女装。头发是真发而且发质非常好，对自己的单马尾非常自信。出于服装可爱的理由在一所女仆咖啡厅打工，在店里很受欢迎。\n似乎很喜欢一个游戏里叫朝日的角色。",
    birthday: "7月10日",
    main_visual: "placeholder.webp",
    extra_data: {
      "性别": "♂",
      "生日": "7月10日",
      "喜欢的食物": "马卡龙和其他甜食！",
      "喜欢的动物": "小熊、猫猫！",
      "兴趣": "女仆咖啡厅的打工",
    },
    sub_visuals: [
      "asahi/avatar_3d.webp",
      "asahi/gamming.webp",
      "asahi/live.webp",
      "asahi/swimming.webp",
    ],
    color: Colors.redAccent,
  ),
];
