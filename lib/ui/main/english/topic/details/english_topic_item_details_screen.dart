import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/presentation/english/topic/details/english_topic_item_details_view_model.dart';
import 'package:english_hero/ui/components/app_drawer.dart';
import 'package:english_hero/ui/components/app_top_bar.dart';
import 'package:english_hero/ui/main/english/topic/details/english_topic_item_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicItemDetailsScreen extends StatelessWidget {
  static const String routeName = '/topic-detail';

  EnglishTopicItemDetailsViewModel _viewModel;

  EnglishTopicItemDetailsScreen(this._viewModel);

  @override
  Widget build(BuildContext context) {
    final topic = ModalRoute.of(context)!.settings.arguments as EnglishTopic;
    bool _isFetched = false;

    return ScopedModel<EnglishTopicItemDetailsViewModel>(
      model: _viewModel,
      child: Scaffold(
          appBar: MyAppBar(context, topic.name, true),
          drawer: AppDrawer(),
          body: ScopedModelDescendant<EnglishTopicItemDetailsViewModel>(
              builder: (ctx, child, viewModel) {
            if (!_isFetched) {
              viewModel.fetchVocabulariesByTopics(topic.id);
              viewModel.getAllVocabulariesByTopic(topic.id);
              _isFetched = true;
            }
            return ListView.builder(
              itemBuilder: (ctx, index) {
                return EnglishTopicItemDetailsWidget(
                    viewModel.vocabularies[index], index + 1);
              },
              itemCount: viewModel.vocabularies.length,
            );
          })),
    );
  }
}
