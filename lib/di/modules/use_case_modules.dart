import 'package:english_hero/domain/repository/english/english_repository.dart';
import 'package:english_hero/domain/repository/user/user_repository.dart';
import 'package:english_hero/domain/usecase/english/fetch_all_topics_use_case.dart';
import 'package:english_hero/domain/usecase/english/get_all_english_topic_use_case.dart';
import 'package:english_hero/domain/usecase/user/authenticate_user.dart';

import '../injection/injetion.dart';
import '../modules/di_module.dart';

class UseCaseModules extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<AuthenticateUseCase>(
        AuthenticateUseCase(getIt.get<UserRepository>()));
    getIt.registerSingleton<FetchAllTopicsUseCase>(
        FetchAllTopicsUseCase(getIt.get<EnglishRepository>()));
    getIt.registerSingleton<GetAllTopicsUseCase>(
        GetAllTopicsUseCase(getIt.get<EnglishRepository>()));
  }
}
