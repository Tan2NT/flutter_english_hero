import 'package:english_hero/presentation/english/english_topics_view_model.dart';
import 'package:english_hero/ui/app_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicsScreen extends StatelessWidget {
  EnglishTopicsViewModel viewModel;

  EnglishTopicsScreen(this.viewModel);

  static const routeName = '/english-topics';

  @override
  Widget build(BuildContext context) {
    return ScopedModel<EnglishTopicsViewModel>(
        model: viewModel, child: topicsListWidget());
  }

  Widget topicsListWidget() => Scaffold(
        appBar: MyAppBar('English Topics'),
        body: listTopicWidget(),
      );

  Widget listTopicWidget() => ScopedModelDescendant<EnglishTopicsViewModel>(
          builder: (ctx, child, model) {
        viewModel.fetchAllTopics();
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(viewModel.englisTopics[index].name);
          },
          itemCount: viewModel.englisTopics.length,
        );
      });
}
