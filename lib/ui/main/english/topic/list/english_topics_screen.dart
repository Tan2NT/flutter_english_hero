import 'package:english_hero/presentation/english/topic/list/english_topics_view_model.dart';
import 'package:english_hero/ui/components/app_drawer.dart';
import 'package:english_hero/ui/components/app_top_bar.dart';
import 'package:english_hero/ui/main/english/topic/list/widgets/english_topic_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicsScreen extends StatelessWidget {
  static const routeName = '/english-topics';
  EnglishTopicsViewModel viewModel;

  EnglishTopicsScreen(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<EnglishTopicsViewModel>(
      model: viewModel,
      child: Scaffold(
        appBar: MyAppBar(context, 'English Topics', false),
        drawer: AppDrawer(),
        body: ScopedModelDescendant<EnglishTopicsViewModel>(
            builder: (ctx, child, model) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return EnglishTopicItemWidget(viewModel.englisTopics[index]);
            },
            itemCount: viewModel.englisTopics.length,
          );
        }),
      ),
    );
  }
}
