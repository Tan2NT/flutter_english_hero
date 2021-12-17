import 'package:english_hero/domain/usecase/english/fetch_all_topics_use_case.dart';
import 'package:english_hero/domain/usecase/english/fetch_vocabularies_by_topic_use_case.dart';
import 'package:english_hero/domain/usecase/english/get_all_english_topic_use_case.dart';
import 'package:english_hero/domain/usecase/english/get_all_vocabularies_by_topic_use_case.dart';
import 'package:english_hero/core/exception/exception_model.dart';
import 'package:english_hero/presentation/english/topic/details/english_topic_item_details_view_model.dart';
import 'package:english_hero/presentation/english/topic/list/english_topics_view_model.dart';
import 'package:english_hero/presentation/english/topic/test/english_topic_test_view_model.dart';

import '../injection/injetion.dart';
import '../modules/di_module.dart';

class ViewModelModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerFactory<EnglishTopicsViewModel>(() => EnglishTopicsViewModel(
        getIt.get<FetchAllTopicsUseCase>(),
        getIt.get<GetAllTopicsUseCase>(),
        getIt.get<FetchVocabulariesByTopicsUseCase>(),
        getIt.get<GetAllVocabulariesByTopicUseCase>()));
    getIt.registerFactory<EnglishTopicItemDetailsViewModel>(() =>
        EnglishTopicItemDetailsViewModel(
            getIt.get<FetchVocabulariesByTopicsUseCase>(),
            getIt.get<GetAllVocabulariesByTopicUseCase>()));
    getIt.registerFactory<EnglishTopicTestViewModel>(() =>
        EnglishTopicTestViewModel(
            getIt.get<GetAllVocabulariesByTopicUseCase>()));
    getIt.registerSingleton<ExceptionModel>(ExceptionModel());
  }
}
