import 'package:flutter/material.dart';

import '../data/color_gradients.dart';


class ColorGradientState extends ChangeNotifier{

  List<Color> gradientBackground = getColorGradient().colorsList;

  void changeBackground(List<Color> background){
    gradientBackground = background;
    notifyListeners();
  }
}
