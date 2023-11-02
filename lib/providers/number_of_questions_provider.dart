import 'package:flutter/material.dart';

class NumberOfQuestionsState extends ChangeNotifier{
  int questionsNo = 5;

  void changeNumberOfQuestions(int number){
    questionsNo = number;
    notifyListeners();
  }
}