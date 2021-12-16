import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/presentation/english/topic/details/english_topic_item_details_view_model.dart';
import 'package:english_hero/ui/base/base_page_screen.dart';
import 'package:english_hero/ui/main/english/topic/details/english_topic_item_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicItemDetailsScreen extends BasePageScreen {
  static const String routeName = '/topic-detail';

  EnglishTopicItemDetailsViewModel _viewModel;

  EnglishTopicItemDetailsScreen(this._viewModel);

  @override
  State<EnglishTopicItemDetailsScreen> createState() =>
      _EnglishTopicItemDetailsScreenState();
}

class _EnglishTopicItemDetailsScreenState
    extends BasePageScreenState<EnglishTopicItemDetailsScreen> with BaseScreen {
  bool _isFetched = false;
  EnglishTopic? topic;

  @override
  void initState() {
    isShowDrawer(false);
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
    appBarTitle(topic!.name);
    return super.build(context);
  }

  @override
  Widget body() {
    return ScopedModel<EnglishTopicItemDetailsViewModel>(
      model: widget._viewModel,
      child: Scaffold(body:
          ScopedModelDescendant<EnglishTopicItemDetailsViewModel>(
              builder: (ctx, child, viewModel) {
        if (!_isFetched) {
          viewModel.fetchVocabulariesByTopics(topic!.id);
          viewModel.getAllVocabulariesByTopic(topic!.id);
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
