import 'package:flutter/material.dart';
import 'package:quiz_app/data/color_gradients.dart';
import 'package:quiz_app/routes/main_route.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => MainRoute(gradientBackground: gradientBackground),
        '/settings': (context) => SettingsRoute(gradientBackground: gradientBackground, onChangeBackground: changeBackground),
      },
    );
  }
}
