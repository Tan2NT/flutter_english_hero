class Question {
  final String questionText;
  final List<String> choices;
  final String correctChoice;
  String userAnswer = '';
  int numberOfCorrect = 0;

  Question(
      {required this.questionText,
      required this.choices,
      required this.correctChoice});

  bool isCorrectAnswer() {
    return correctChoice == userAnswer;
  }

  bool hasChosen() {
    return userAnswer.isNotEmpty;
  }
}
