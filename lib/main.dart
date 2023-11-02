import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/main_container.dart';
import 'package:quiz_app/providers/color_gradient_provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorGradientState(),
      child: const MainContainer(),
    )
  );
}