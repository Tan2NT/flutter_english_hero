import 'package:english_hero/domain/usecase/english/fetch_all_topics_use_case.dart';
import 'package:english_hero/presentation/english/english_topics_view_model.dart';

import '../injection/injetion.dart';
import '../modules/di_module.dart';

class ViewModelModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerFactory<EnglishTopicsViewModel>(
        () => EnglishTopicsViewModel(getIt.get<FetchAllTopicsUseCase>()));
  }
}
