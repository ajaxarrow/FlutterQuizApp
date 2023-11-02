import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizSummary extends StatelessWidget{
  const QuizSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 10
                    ),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data['user_answer'] == data['correct_option']?const Color.fromARGB(255, 124, 209, 127):const Color.fromARGB(255, 255, 128, 119),
                    ),
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.assistant(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    )
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.assistant(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Your Answer: ',
                                style: GoogleFonts.assistant(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                                )
                              ),
                              TextSpan(
                                text: data['user_answer'] as String,
                                style: GoogleFonts.assistant(
                                  color: const Color.fromARGB(
                                      248, 234, 185, 212)
                                )
                              ),
                            ]
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Correct Answer: ',
                                style: GoogleFonts.assistant(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                                )
                              ),
                              TextSpan(
                                text: data['correct_option'] as String,
                                style: GoogleFonts.assistant(
                                  color: const Color.fromARGB(
                                      248, 213, 178, 236)
                                )
                              ),
                            ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}