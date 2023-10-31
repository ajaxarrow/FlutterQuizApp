class Question {
  Question(this.question, this.options);


  final String question;
  final List<String> options;


  List<String> getShuffledAnswers(){
    final shuffledOptions = List.of(options);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }
}