import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300.0,
              color: Colors.white54
            ),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              'Ready, Set, Quiz!',
              style: GoogleFonts.assistant(
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
                color: Colors.white70
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white70,
                padding: const EdgeInsets.all(15.0)
              ),
              icon: const Icon(
                Icons.arrow_circle_right,
                
              ),
              label: Text(
                'Get Started',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w500
                ),
              ),
            )
          ],
        ),
      );
  }
}