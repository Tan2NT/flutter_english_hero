import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/presentation/english/topic/test/english_topic_test_view_model.dart';
import 'package:english_hero/ui/components/app_drawer.dart';
import 'package:english_hero/ui/components/app_top_bar.dart';
import 'package:english_hero/ui/main/english/topic/test/widgets/quiz_view.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicTestScreen extends StatefulWidget {
  static final routeName = '/english-test';

  EnglishTopicTestViewModel _viewModel;

  EnglishTopicTestScreen(this._viewModel);

  @override
  State<EnglishTopicTestScreen> createState() => _EnglishTopicTestScreenState();
}

class _EnglishTopicTestScreenState extends State<EnglishTopicTestScreen> {
  @override
  Widget build(BuildContext context) {
    final topic = ModalRoute.of(context)!.settings.arguments as EnglishTopic;
    return ScopedModel<EnglishTopicTestViewModel>(
      model: widget._viewModel,
      child: Scaffold(
        appBar: MyAppBar(context, 'Test - ${topic.name}', true),
        drawer: AppDrawer(),
        body: ScopedModelDescendant<EnglishTopicTestViewModel>(
            builder: (ctx, child, model) {
          model.populateQuiz(topic.id);

          if (model.quiz.hasChosenAll()) {
            Future.delayed(Duration.zero, () async {
              _showResultDialog(topic, model.quiz.questions.length,
                  model.quiz.totalCorrectAnswer, model);
            });
          }

          return ListView.builder(
            itemBuilder: (ctx, index) {
              return QuizView(
                  index: index,
                  question: model.quiz.questions[index].questionText,
                  choices: model.quiz.questions[index].choices,
                  answerHandler: (index, answer) {
                    model.updateAnswer(index, answer);
                  });
            },
            itemCount: model.quiz.questions.length,
          );
        }),
      ),
    );
  }

  void _showResultDialog(EnglishTopic topic, int totalQuestion,
      int correctAnswer, EnglishTopicTestViewModel model) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('Test Result'),
              content: Text(
                  'You answered $correctAnswer out of $totalQuestion questions correctly !'),
              actions: [
                FlatButton(
                    onPressed: () {
                      model.resetAnswers();
                      Navigator.pop(context, true);
                      Navigator.pop(context, true);
                    },
                    child: const Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                FlatButton(
                    onPressed: () async {
                      await model.resetAnswers();
                      Navigator.pop(context, true);
                    },
                    child: const Text('Try again',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)))
              ],
            ));
  }
}
