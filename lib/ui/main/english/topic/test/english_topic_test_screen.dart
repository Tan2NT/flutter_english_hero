// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/presentation/english/topic/test/english_topic_test_view_model.dart';
import 'package:english_hero/ui/base/base_page_screen.dart';
import 'package:english_hero/ui/main/english/topic/test/widgets/quiz_view.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicTestScreen extends BasePageScreen {
  static const routeName = '/english-test';

  final EnglishTopicTestViewModel _viewModel;

  const EnglishTopicTestScreen(this._viewModel, {Key? key}) : super(key: key);

  @override
  State<EnglishTopicTestScreen> createState() => _EnglishTopicTestScreenState();
}

class _EnglishTopicTestScreenState
    extends BasePageScreenState<EnglishTopicTestScreen> with BaseScreen {
  late EnglishTopic topic;

  @override
  void initState() {
    super.initState();
  }

  @override
  void appBarTitle(String title) {
    super.appBarTitle(title);
  }

  @override
  void isBackButton(bool isBack) {
    super.isBackButton(isBack);
  }

  @override
  Widget build(BuildContext context) {
    topic = ModalRoute.of(context)!.settings.arguments as EnglishTopic;
    appBarTitle(topic.name);
    return super.build(context);
  }

  @override
  Widget body() {
    return ScopedModel<EnglishTopicTestViewModel>(
      model: widget._viewModel,
      child: Scaffold(
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
              title: Text(
                'test_result_title'.tr(),
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              content: const Text('test_result_details').tr(
                  args: [correctAnswer.toString(), totalQuestion.toString()]),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {
                      model.resetAnswers();
                      Navigator.pop(context, true);
                      Navigator.pop(context, true);
                    },
                    child: Text(
                      'home'.tr(),
                      style: const TextStyle(fontSize: 20),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () async {
                      await model.resetAnswers();
                      Navigator.pop(context, true);
                    },
                    child: Text('try_again'.tr(),
                        style: const TextStyle(fontSize: 20)))
              ],
            ));
  }
}
