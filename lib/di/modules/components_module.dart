import 'package:english_hero/domain/usecase/user/authenticate_user.dart';
import 'package:english_hero/presentation/provider/user_provider.dart';

import '../injection/injetion.dart';
import '../modules/di_module.dart';

class ComponentsModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<UserProvider>(
        UserProvider(getIt.get<AuthenticateUseCase>()));
  }
}
