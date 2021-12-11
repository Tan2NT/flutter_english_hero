import 'package:english_hero/data/remote/api/user_api_service.dart';
import 'dart:convert';
import '../../common/model/user/user_entity.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> signUp(String email, String password);

  Future<UserEntity> logIn(String email, String password);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final UserApiService userApiService;

  UserRemoteDataSourceImpl(this.userApiService);

  @override
  Future<UserEntity> signUp(String email, String password) async {
    return await userApiService.signUp(email, password);
  }

  @override
  Future<UserEntity> logIn(String email, String password) async {
    return await userApiService.logIn(email, password);
  }
}
