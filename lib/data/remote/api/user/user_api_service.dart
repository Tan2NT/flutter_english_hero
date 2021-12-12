import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../../../../core/exception/http_exception.dart';
import '../../../common/model/user/user_entity.dart';

class UserApiService {
  static const BASE_URL = "https://identitytoolkit.googleapis.com/v1/accounts";
  static const API_KEY = "AIzaSyCTIVquwOn2K4tmvJYAocEmTHJS4xYfEhI";

  Future<UserEntity> signUp(String email, String password) async {
    return authenticate(email, password, "signUp");
  }

  Future<UserEntity> logIn(String email, String password) async {
    return authenticate(email, password, "signInWithPassword");
  }

  Future<UserEntity> authenticate(
      String email, String password, String authMethod) async {
    final url = Uri.parse('$BASE_URL:$authMethod?key=$API_KEY');
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      final userData = json.decode(response.body);
      if (userData['error'] != null) {
        throw HttpException(userData['error']['message']);
      }
      return UserEntity.fromJson(userData);
    } catch (error) {
      rethrow;
    }
  }
}
