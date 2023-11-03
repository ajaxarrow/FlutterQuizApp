import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/start_screen.dart';
import '../providers/color_gradient_provider.dart';


class MainRoute extends StatelessWidget{
  const MainRoute({super.key});



  @override
  Widget build(BuildContext context) {
    final colorGradientState = Provider.of<ColorGradientState>(context);

  
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colorGradientState.gradientBackground,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
              )
          ),
          child: const StartScreen()
        )
    );
  }
}