import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 40
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300.0,
              color: Colors.white54
            ),
            const SizedBox(
              height: 27.0,
            ),
            Text(
              'Ready, Set, Quiz!',
              textAlign: TextAlign.center,
              style: GoogleFonts.assistant(
                fontWeight: FontWeight.w700,
                fontSize: 35.0,
                color: Colors.white70
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 5
              ),
              child: OutlinedButton.icon(
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black12,
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
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 5
              ),
              child: OutlinedButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/settings');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black12,
                  foregroundColor: Colors.white70,
                  padding: const EdgeInsets.all(15.0)
                ),
                icon: const Icon(
                  Icons.settings,

                ),
                label: Text(
                  'Settings',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      );
  }
}