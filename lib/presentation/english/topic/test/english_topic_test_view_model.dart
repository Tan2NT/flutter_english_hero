import 'dart:math';

import 'package:english_hero/domain/usecase/english/get_all_vocabularies_by_topic_use_case.dart';
import 'package:english_hero/presentation/model/question.dart';
import 'package:english_hero/presentation/model/quiz.dart';
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicTestViewModel extends Model {
  GetAllVocabulariesByTopicUseCase getVocabulariesUsecase;

  EnglishTopicTestViewModel(this.getVocabulariesUsecase);

  Quiz quiz = Quiz([
    // Question(
    //     questionText: 'Dog',
    //     choices: ['Cho', 'Meo', 'Ga', 'vit'],
    //     correctChoice: 'Cho'),
    // Question(
    //     questionText: 'Cat',
    //     choices: ['Cho', 'Meo', 'Ga', 'vit'],
    //     correctChoice: 'Meo'),
    // Question(
    //     questionText: 'Chicken',
    //     choices: ['Cho', 'Meo', 'Ga', 'vit'],
    //     correctChoice: 'Ga'),
    // Question(
    //     questionText: 'Duck',
    //     choices: ['Cho', 'Meo', 'Ga', 'vit'],
    //     correctChoice: 'Vit'),
  ]);

  Future populateQuiz(int topicId) async {
    final vocabularies = await getVocabulariesUsecase.execute(topicId);
    quiz.reset();
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
        quiz.questions.add(Question(
            questionText: words[i],
            choices: getRandomChoice(randomMeanings, meanings[i]),
            correctChoice: meanings[i]));
      } else {
        List<String> randomWords = List.from(words);
        randomWords.shuffle();
        quiz.questions.add(Question(
            questionText: meanings[i],
            choices: getRandomChoice(randomWords, words[i]),
            correctChoice: words[i]));
      }
    }
    notifyListeners();
  }

  List<String> getRandomChoice(List<String> choices, String correct) {
    int end = choices.length < 4 ? choices.length : 3;
    List<String> subChoice =
        choices.where((ch) => ch != correct).toList().sublist(0, end) +
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

  void resetAnswers() {
    for (var question in quiz.questions) {
      question.userAnswer = '';
    }
    quiz.totalCorrectAnswer = 0;
    notifyListeners();
  }
}
