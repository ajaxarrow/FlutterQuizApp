import 'package:flutter/material.dart';
import 'package:quiz_app/data/color_gradients.dart';
import 'package:quiz_app/routes/main_route.dart';
import 'package:quiz_app/routes/quiz_route.dart';
import 'package:quiz_app/routes/settings_route.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  List<Color> gradientBackground = [];

  void changeBackground(List<Color> background){
    setState(() {
      gradientBackground = background;
    });
  }

  @override
  void initState() {
    super.initState();
    gradientBackground = getColorGradient().colorsList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainRoute(),
        '/quiz': (context) => const QuizRoute(),
        '/settings': (context) => const SettingsRoute(),
      },
    );
  }
}
