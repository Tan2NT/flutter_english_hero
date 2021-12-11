import 'package:english_hero/domain/model/auth_mode.dart';

import '../../model/user/user.dart';
import '../../repository/user_repository.dart';

class AuthenticateUseCase {
  UserRepository _userRepo;

  AuthenticateUseCase(this._userRepo);

  Future<User> execute(String email, String password, AuthMode authMode) {
    return authMode == AuthMode.signUp
        ? _userRepo.signUp(email, password)
        : _userRepo.signIn(email, password);
  }
}
