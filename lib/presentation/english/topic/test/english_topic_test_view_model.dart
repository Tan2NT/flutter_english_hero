import 'dart:math';

import 'package:english_hero/domain/usecase/english/get_all_vocabularies_by_topic_use_case.dart';
import 'package:english_hero/presentation/model/question.dart';
import 'package:english_hero/presentation/model/quiz.dart';
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicTestViewModel extends Model {
  GetAllVocabulariesByTopicUseCase getVocabulariesUsecase;

  EnglishTopicTestViewModel(this.getVocabulariesUsecase);

  Quiz quiz = Quiz([], 0);

  Future populateQuiz(int topicId) async {
    final vocabularies = await getVocabulariesUsecase.execute(topicId);
    Quiz newQuiz = Quiz([], 0);
    List<String> words = [];
    List<String> meanings = [];
    for (var vocab in vocabularies) {
      words.add(vocab.word);
      meanings.add(vocab.meaningVi);
    }

    for (var i = 0; i < vocabularies.length; i++) {
      final selectWordAsQestion = Random().nextBool();
      if (selectWordAsQestion) {
        List<String> randomMeanings = List.from(meanings);
        randomMeanings.shuffle();
        newQuiz.questions.add(Question(
            questionText: words[i],
            choices: getRandomChoice(randomMeanings, meanings[i]),
            correctChoice: meanings[i]));
      } else {
        List<String> randomWords = List.from(words);
        randomWords.shuffle();
        newQuiz.questions.add(Question(
            questionText: meanings[i],
            choices: getRandomChoice(randomWords, words[i]),
            correctChoice: words[i]));
      }
    }

    if (quiz.questions.length != newQuiz.questions.length) {
      quiz = newQuiz;
      notifyListeners();
    }
  }

  List<String> getRandomChoice(List<String> choices, String correct) {
    int end = choices.length - 1;
    List<String> subChoice = choices
            .where((ch) => ch != correct)
            .toList()
            .sublist(0, end < 4 ? end : 4) +
        [correct];
    subChoice.shuffle();
    return subChoice;
  }

  void updateAnswer(int questionIndex, String answer) {
    quiz.questions[questionIndex].userAnswer = answer;
    if (quiz.hasChosenAll()) {
      quiz.totalCorrectAnswer = quiz.getTotalCorrectAnswer();
      notifyListeners();
    }
  }

  Future resetAnswers() async {
    for (var question in quiz.questions) {
      question.userAnswer = '';
    }
    quiz.totalCorrectAnswer = 0;
    notifyListeners();
  }
}
