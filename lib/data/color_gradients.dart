import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/gradients.dart';

var colorGradients = [
  ColorGradient(
    'Man of Steel',
    const [
      Color(0xff780206),
      Color(0xff061161)
    ]
  ),
  ColorGradient(
      'Dracula',
      const [
        Color(0xffdc2424),
        Color(0xff4a569d)
      ]
  ),
  ColorGradient(
      'Instagram',
      const [
        Color(0xff833ab4),
        Color(0xfffd1d1d)
      ]
  ),
  ColorGradient(
      'Blush',
      const [
        Color(0xffb24592),
        Color(0xfff15f79)
      ]
  ),
  ColorGradient(
      'Virgin America',
      const [
        Color(0xff7b4397),
        Color(0xffdc2430)
      ]
  ),
  ColorGradient(
      'Celestial',
      const [
        Color(0xffc33764),
        Color(0xff1d2671)
      ]
  ),
  ColorGradient(
      'Day Tripper',
      const [
        Color(0xfff857a6),
        Color(0xffff5858)
      ]
  ),
  ColorGradient(
      'Influenza',
      const [
        Color(0xffC04848),
        Color(0xff480048)
      ]
  ),
  ColorGradient(
      'Aubergine',
      const [
        Color(0xffAA076B),
        Color(0xff61045f)
      ]
  ),
  ColorGradient(
      'Purple Paradise',
      const [
        Color(0xff1D2B64),
        Color(0xfff8cdda)
      ]
  ),
  ColorGradient(
      'Sea Blue',
      const [
        Color(0xff2b5876),
        Color(0xff4e4376)
      ]
  ),
  ColorGradient(
      'Lawrencium',
      const [
        Color(0xff0f0c29),
        Color(0xff302b63)
      ]
  ),
  ColorGradient(
      'Wiretap',
      const [
        Color(0xff8A2387),
        Color(0xffE94057)
      ]
  ),
  ColorGradient(
      'Shifter',
      const [
        Color(0xffbc4e9c),
        Color(0xfff80759)
      ]
  ),
  ColorGradient(
      'Relay',
      const [
        Color(0xff3A1C71),
        Color(0xffD76D77)
      ]
  ),
  ColorGradient(
      'Anamnisar',
      const [
        Color(0xff9796f0),
        Color(0xfffbc7d4)
      ]
  ),
  ColorGradient(
      'Pinky',
      const [
        Color(0xffDD5E89),
        Color(0xffF7BB97)
      ]
  ),
  ColorGradient(
      'Rose Water',
      const [
        Color(0xffE55D87),
        Color(0xff5FC3E4)
      ]
  ),
  ColorGradient(
      'Bloody Mary',
      const [
        Color(0xffFF512F),
        Color(0xffDD2476)
      ]
  ),
  ColorGradient(
      'Blurry Beach',
      const [
        Color(0xffd53369),
        Color(0xffcbad6d)
      ]
  ),
  ColorGradient(
      'Dirty Fog',
      const [
        Color(0xffB993D6),
        Color(0xff8CA6DB)
      ]
  ),
  ColorGradient(
      'Shroom Haze',
      const [
        Color(0xff5C258D),
        Color(0xff4389A2)
      ]
  ),
  ColorGradient(
      'Witching Hour',
      const [
        Color(0xff642B73),
        Color(0xffC6426E)
      ]
  ),
  ColorGradient(
      'Witching Hour',
      const [
        Color(0xffc31432),
        Color(0xff240b36)
      ]
  ),
  ColorGradient(
      'Pink Flavour',
      const [
        Color(0xff800080),
        Color(0xffffc0cb)
      ]
  ),
  ColorGradient(
      'Cherry Blossoms',
      const [
        Color(0xffFBD3E9),
        Color(0xffBB377D)
      ]
  ),
  ColorGradient(
      'Starfall',
      const [
        Color(0xffF0C27B),
        Color(0xff4B1248)
      ]
  ),
  ColorGradient(
      'Emo Kid',
      const [
        Color(0xff556270),
        Color(0xffFF6B6B)
      ]
  ),
];

ColorGradient getColorGradient(){
  Random random = Random();
  int randomIndex = random.nextInt(colorGradients.length);
  ColorGradient generatedColorAlbum = colorGradients[randomIndex];

  return generatedColorAlbum;
}