// ignore: implementation_imports
import "package:easy_localization/src/public_ext.dart";
import 'package:english_hero/presentation/english/topic/list/english_topics_view_model.dart';
import 'package:english_hero/ui/base/base_page_screen.dart';
import 'package:english_hero/ui/base/splash_screen.dart';
import 'package:english_hero/ui/main/english/topic/english_topic_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// ignore: must_be_immutable
class EnglishTopicsScreen extends BasePageScreen {
  static const routeName = '/english-topics';
  EnglishTopicsViewModel viewModel;

  EnglishTopicsScreen(this.viewModel, {Key? key}) : super(key: key);

  @override
  State<EnglishTopicsScreen> createState() => _EnglishTopicsScreenState();
}

class _EnglishTopicsScreenState extends BasePageScreenState<EnglishTopicsScreen>
    with BaseScreen {
  @override
  void initState() {
    isBackButton(false);
    appBarTitle('app_name'.tr());
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
  Widget body() {
    return ScopedModel<EnglishTopicsViewModel>(
      model: widget.viewModel,
      child: Scaffold(
        body: ScopedModelDescendant<EnglishTopicsViewModel>(
            builder: (ctx, child, model) {
          return model.englisTopics.isEmpty
              ? const SplashScreen()
              : ListView.builder(
                  itemBuilder: (ctx, index) {
                    return EnglishTopicItemWidget(
                        widget.viewModel.englisTopics[index]);
                  },
                  itemCount: widget.viewModel.englisTopics.length,
                );
        }),
      ),
    );
  }
}
