import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/widgets/quiz_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {required this.selectedOptions,
      required this.selectedQuestions,
      required this.onRestartQuiz,
      super.key});

  final List<String> selectedOptions;
  final List<Question> selectedQuestions;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedOptions.length; i++) {
      summary.add({
        'question_index': i,
        'question': selectedQuestions[i].question,
        'correct_option': selectedQuestions[i].options[0],
        'user_answer': selectedOptions[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = selectedQuestions.length;
    final correctAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_option'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: 'You answered ',
              style: GoogleFonts.assistant(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 237, 193, 241)
              ),
              children: [
                WidgetSpan(
                  child: AnimatedDigitWidget(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOutCubic,
                    value: correctAnswers,
                    textStyle: GoogleFonts.assistant(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 237, 193, 241)
                    ),
                  )
                ),
                TextSpan(
                  text: ' out of $totalQuestions questions correctly!',
                  style: GoogleFonts.assistant(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 237, 193, 241)
                  ),
                ),
              ],
            ),
          ),
          // Text(
          //   'You answered $correctAnswers out of $totalQuestions questions correctly!',
          //   textAlign: TextAlign.center,
          //   style: GoogleFonts.assistant(
          //       fontSize: 22,
          //       fontWeight: FontWeight.bold,
          //       color: const Color.fromARGB(255, 237, 193, 241)),
          // ),
          const SizedBox(height: 30),
          QuizSummary(summaryData),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                onPressed: onRestartQuiz,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black12,
                  foregroundColor: const Color.fromARGB(255, 239, 212, 241),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 10.0
                  )
                ),
                label: Text(
                  'Restart Quiz',
                  style: GoogleFonts.assistant(fontWeight: FontWeight.w600),
                ),
                icon: const Icon(Icons.refresh),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black12,
                    foregroundColor: const Color.fromARGB(255, 239, 212, 241),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 10.0
                    )
                ),
                label: Text(
                  'Back to Home',
                  style: GoogleFonts.assistant(fontWeight: FontWeight.w600),
                ),
                icon: const Icon(Icons.home),
              ),
            )
          ],)
        ]),
      ),
    );
  }
}
