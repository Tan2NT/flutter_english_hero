import 'package:english_hero/data/local/dao/topic_dao.dart';
import 'package:english_hero/data/local/dao/vocabularies_dao.dart';
import 'package:english_hero/data/local/english_database.dart';
import 'package:english_hero/data/local/english_local_data_source.dart';
import 'package:english_hero/data/remote/api/english/english_api_service.dart';
import 'package:english_hero/data/remote/api/user/user_api_service.dart';
import 'package:english_hero/data/remote/data_source/english_remote_data_source.dart';
import 'package:english_hero/data/remote/data_source/user_remote_data_source.dart';
import 'package:http/http.dart';

import '../injection/injetion.dart';
import '../modules/di_module.dart';

class DataSourceModules extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<UserRemoteDataSource>(
        UserRemoteDataSourceImpl(getIt.get<UserApiService>()));
    getIt.registerSingleton<EnglishRemoteDataSource>(
        EnglishRemoteDataSourceImpl(getIt.get<EnglishApiService>()));
    getIt.registerSingleton<EnglishTopicDAO>(EnglishTopicDAO());
    getIt.registerSingleton<EnglishVocabulariesDAO>(EnglishVocabulariesDAO());
    getIt.registerSingleton<EnglishLocalDataSource>(EnglishLocalDataSourceImpl(
        getIt.get<EnglishTopicDAO>(), getIt.get<EnglishVocabulariesDAO>()));
  }
}
