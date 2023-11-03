import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/data/quiz_questions.dart';
import 'package:quiz_app/models/questions.dart';

import '../providers/color_gradient_provider.dart';
import '../providers/number_of_questions_provider.dart';

class QuizRoute extends StatefulWidget {
  const QuizRoute({super.key});

  @override
  State<QuizRoute> createState() => _QuizRouteState();
}

class _QuizRouteState extends State<QuizRoute> {
  List<Question> selectedQuestions = [];
  List<String> selectedOptions = [];


  var currentScreen = 'quiz-screen';


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorGradientState = Provider.of<ColorGradientState>(context);
    final noOfQuestionState = Provider.of<NumberOfQuestionsState>(context);

    getNewQuestions(list){
      var newList = list;
      newList.shuffle();
      return newList.sublist(0, noOfQuestionState.questionsNo);
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

    // void goToHomeScreen(){
    //   setState(() {
    //     currentScreen = 'start-screen';
    //     selectedOptions = [];
    //     selectedQuestions = getNewQuestions(questions);
    //   });
    // }

    Widget screenWidget = QuestionsScreen(onSelectOption: selectOption, selectedQuestions: selectedQuestions);

    if (selectedQuestions.isEmpty) {
      selectedQuestions = getNewQuestions(questions);
    }

    if (currentScreen == 'quiz-screen'){
      setState(() {
        screenWidget = QuestionsScreen(
          onSelectOption: selectOption,
          selectedQuestions: selectedQuestions,
        );
      });
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


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
