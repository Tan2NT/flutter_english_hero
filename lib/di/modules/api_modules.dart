import 'package:english_hero/data/remote/api/user_api_service.dart';

import '../injection/injetion.dart';
import '../modules/di_module.dart';

class ApiModules extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<UserApiService>(UserApiService());
  }
}
