import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/data/quiz_questions.dart';
import 'package:quiz_app/models/questions.dart';

import '../providers/color_gradient_provider.dart';


class MainRoute extends StatefulWidget{
  const MainRoute({super.key});
  @override
  State <MainRoute> createState(){
    return _MainRouteState();
  }
}

class _MainRouteState extends State <MainRoute>{
  List<Question> selectedQuestions = [];
  List<String> selectedOptions = [];


  var currentScreen = 'start-screen';
  // late Widget currentScreen;

  // @override
  // void initState() {
  //   currentScreen = StartScreen(changeScreen);
  //   super.initState();
  // }

  getNewQuestions(list){
    var newList = list;
    newList.shuffle();
    return newList.sublist(0, 5);
  }

  void changeScreen() {
    setState(() {
      currentScreen = 'quiz-screen';
    });
  }

  void selectOption(String option){
    selectedOptions.add(option);
    if (selectedOptions.length == selectedQuestions.length){
      setState(() {
        currentScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedOptions = [];
      currentScreen = 'quiz-screen';
      selectedQuestions = getNewQuestions(questions);
    });
  }

  void goToHomeScreen(){
    setState(() {
      currentScreen = 'start-screen';
      selectedOptions = [];
      selectedQuestions = getNewQuestions(questions);
    });
  }

  @override
  void initState() {
    super.initState();
    selectedQuestions = getNewQuestions(questions);
  }

  @override
  Widget build(BuildContext context) {
    final colorGradientState = Provider.of<ColorGradientState>(context);
    Widget screenWidget = StartScreen(changeScreen);

    if (currentScreen == 'quiz-screen'){
      setState(() {
        screenWidget = QuestionsScreen(
          onSelectOption: selectOption,
          selectedQuestions: selectedQuestions,
        );
      });
    }

    else if(currentScreen == 'start-screen'){
      screenWidget = StartScreen(changeScreen);
    }

    else if(currentScreen == 'results-screen'){
       setState(() {
        screenWidget = ResultsScreen(
          selectedOptions: selectedOptions,
          selectedQuestions: selectedQuestions,
          onRestartQuiz: (){
            restartQuiz();
          },
          onGoToHomeScreen: (){
            goToHomeScreen();
          },
        );
      });
    }
    
  
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colorGradientState.gradientBackground,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
              )
          ),
          child: screenWidget
        )
      );
  }
}