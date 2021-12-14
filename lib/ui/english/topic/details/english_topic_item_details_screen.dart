import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/presentation/english/topic/details/english_topic_item_details_view_model.dart';
import 'package:english_hero/ui/app_top_bar.dart';
import 'package:english_hero/ui/english/topic/details/english_topic_item_details_widget.dart';
import 'package:english_hero/ui/english/topic/list/widgets/english_topic_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicItemDetailsScreen extends StatelessWidget {
  static const String routeName = '/topic-detail';

  EnglishTopicItemDetailsViewModel _viewModel;

  EnglishTopicItemDetailsScreen(this._viewModel);

  @override
  Widget build(BuildContext context) {
    final topic = ModalRoute.of(context)!.settings.arguments as EnglishTopic;

    return ScopedModel<EnglishTopicItemDetailsViewModel>(
      model: _viewModel,
      child: vocabulariesWidget(topic),
    );
  }

  Widget vocabulariesWidget(EnglishTopic topic) => Scaffold(
      appBar: MyAppBar(topic.name),
      body: ScopedModelDescendant<EnglishTopicItemDetailsViewModel>(
          builder: (ctx, child, viewModel) {
        viewModel.fetchVocabulariesByTopics(topic.id);
        viewModel.getAllTVocabulariesByTopic(topic.id);
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return EnglishTopicItemDetailsWidget(viewModel.vocabularies[index]);
          },
          itemCount: viewModel.vocabularies.length,
        );
      }));
}
