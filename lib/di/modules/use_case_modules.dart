import 'package:english_hero/domain/repository/user_repository.dart';
import 'package:english_hero/domain/usecase/user/authenticate_user.dart';

import '../injection/injetion.dart';
import '../modules/di_module.dart';

class UseCaseModules extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<AuthenticateUseCase>(
        AuthenticateUseCase(getIt.get<UserRepository>()));
  }
}
