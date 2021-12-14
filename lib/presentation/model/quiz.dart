import 'package:english_hero/presentation/model/question.dart';

class Quiz {
  List<Question> questions;
  int totalCorrectAnswer = 0;

  Quiz(this.questions);

  bool hasChosenAll() {
    if (questions.isEmpty) return false;
    bool chosenAll = true;
    for (var question in questions) {
      if (question.userAnswer.isEmpty) {
        chosenAll = false;
      }
    }
    return chosenAll;
  }

  int getTotalCorrectAnswer() {
    if (questions.isEmpty) return 0;
    int correctCount = 0;
    for (var question in questions) {
      if (question.isCorrectAnswer()) {
        correctCount++;
      }
    }
    return correctCount;
  }

  void reset() {
    questions.clear();
    totalCorrectAnswer = 0;
  }
}
