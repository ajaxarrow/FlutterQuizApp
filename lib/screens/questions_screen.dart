import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/option_button.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/widgets/progress_bar.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({
    required this.onSelectOption, 
    required this.selectedQuestions,
    super.key
  });

  final void Function(String answer) onSelectOption;
  final List<Question> selectedQuestions;

  @override
  State <QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State <QuestionsScreen>{
  
  var currentQuestionIndex = 0;

  double progress = 0.0;

  void answerQuestion(String selectedOption){
    widget.onSelectOption(selectedOption);

    setState(() {
      if (currentQuestionIndex < widget.selectedQuestions.length - 1){
        currentQuestionIndex++;
      }
      progress = currentQuestionIndex / widget.selectedQuestions.length;
    });
  }

  @override
  Widget build(BuildContext context) {

    final newQuestions = widget.selectedQuestions;
    final currentQuestion = newQuestions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedProgressBar(value: progress),
            const SizedBox(height: 25),
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.assistant(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600
              )
            ),
            const SizedBox(height: 25),
            ...currentQuestion.getShuffledAnswers().map((String option) {
              return OptionButton(
                optionText: option, 
                onPressed: (){
                  answerQuestion(option);
                }
              );
            }),
            // ...currentQuestion.options.map((option) {
            //   return OptionButton(
            //     optionText: option, 
            //     onPressed: (){}
            //   );
            // })
          ],
        ),
      ),
    );
  }
}