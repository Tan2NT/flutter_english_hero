import 'package:english_hero/data/remote/data_source/user_remote_data_source.dart';
import 'package:english_hero/domain/mapper/user/user_mapper.dart';

import '../../model/user/user.dart';

abstract class UserRepository {
  Future<User> signUp(String email, String password);
  Future<User> signIn(String email, String password);
}

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl(this.userRemoteDataSource);

  @override
  Future<User> signUp(String email, String password) async {
    final userEntity = await userRemoteDataSource.signUp(email, password);
    return UserMapper().mapFromEntity(userEntity);
  }

  @override
  Future<User> signIn(String email, String password) async {
    final userEntity = await userRemoteDataSource.logIn(email, password);
    return UserMapper().mapFromEntity(userEntity);
  }
}
