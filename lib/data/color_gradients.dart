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
];

ColorGradient getColorGradient(){
  Random random = Random();
  int randomIndex = random.nextInt(colorGradients.length);
  ColorGradient generatedColorAlbum = colorGradients[randomIndex];

  return generatedColorAlbum;
}