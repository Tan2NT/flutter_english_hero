import 'package:english_hero/data/local/english_local_data_source.dart';
import 'package:english_hero/data/remote/data_source/english_remote_data_source.dart';
import 'package:english_hero/data/remote/data_source/user_remote_data_source.dart';
import 'package:english_hero/domain/repository/english/english_repository.dart';
import 'package:english_hero/domain/repository/user/user_repository.dart';

import '../injection/injetion.dart';
import '../modules/di_module.dart';

class RepositoryModules extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<UserRepository>(
        UserRepositoryImpl(getIt.get<UserRemoteDataSource>()));
    getIt.registerSingleton<EnglishRepository>(EnglishRepositoryimpl(
        getIt.get<EnglishRemoteDataSource>(),
        getIt.get<EnglishLocalDataSource>()));
  }
}
