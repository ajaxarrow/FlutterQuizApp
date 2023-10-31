import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/data/quiz_questions.dart';
import 'package:quiz_app/models/questions.dart';


class MainContainer extends StatefulWidget{
  const MainContainer({super.key});
  
  @override
  State <MainContainer> createState(){
    return _MainContainerState();
  }
}

class _MainContainerState extends State <MainContainer>{
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

  @override
  void initState() {
    super.initState();
    selectedQuestions = getNewQuestions(questions);
  }

  @override
  Widget build(BuildContext context) {
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
        );
      });
    }
    
  
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(221, 86, 30, 112),
                Color.fromARGB(221, 114, 7, 60),
                Color.fromARGB(221, 54, 10, 52)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
              )
          ),
          child: screenWidget
        )
      )
    );
  }
}