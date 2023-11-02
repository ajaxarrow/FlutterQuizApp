import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/main_container.dart';
import 'package:quiz_app/providers/color_gradient_provider.dart';
import 'package:quiz_app/providers/number_of_questions_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ColorGradientState(),
        ),
        ChangeNotifierProvider(
          create: (context) => NumberOfQuestionsState(),
        ),
      ],
      child: const MainContainer(),
    ),
  );
}
