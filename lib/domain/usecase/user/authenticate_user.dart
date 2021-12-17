import 'package:english_hero/domain/model/auth_mode.dart';

import '../../model/user/user.dart';
import '../../repository/user/user_repository.dart';

class AuthenticateUseCase {
  final UserRepository _userRepo;

  AuthenticateUseCase(this._userRepo);

  Future<User> execute(String email, String password, AuthMode authMode) async {
    return await (authMode == AuthMode.signUp
        ? _userRepo.signUp(email, password)
        : _userRepo.signIn(email, password));
  }
}
