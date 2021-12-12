import 'package:english_hero/presentation/english/english_topics_view_model.dart';
import 'package:english_hero/ui/app_top_bar.dart';
import 'package:english_hero/ui/english/topic/list/widget/english_topic_item.dart';
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
        viewModel.getAllTopics();
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return EnglishTopicItemView(viewModel.englisTopics[index]);
          },
          itemCount: viewModel.englisTopics.length,
        );
      });
}
