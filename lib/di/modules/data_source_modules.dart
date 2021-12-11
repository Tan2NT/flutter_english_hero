import 'package:english_hero/data/remote/api/user_api_service.dart';
import 'package:english_hero/data/remote/data_source/user_remote_data_source.dart';

import '../injection/injetion.dart';
import '../modules/di_module.dart';

class DataSourceModules extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<UserRemoteDataSource>(
        UserRemoteDataSourceImpl(getIt.get<UserApiService>()));
  }
}
