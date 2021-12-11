import 'package:english_hero/core/exception/http_exception.dart';
import 'package:english_hero/domain/model/auth_mode.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

import '../../domain/usecase/user/authenticate_user.dart';
import '../../domain/model/user/user.dart';

class UserProvider with ChangeNotifier {
  User _user = User(email: '', userId: '', token: '', expiryDate: null);
  Timer? _authTimer = null;
  String errorMessage = '';

  AuthenticateUseCase _authenticateUseCase;

  UserProvider(this._authenticateUseCase);

  String get token {
    if (_user.expiryDate == null) return '';
    if (_user.expiryDate!.isAfter(DateTime.now()) && _user.token.isNotEmpty) {
      return _user.token;
    }
    return '';
  }

  bool get isAuth {
    return token.isNotEmpty;
  }

  String get userId {
    return _user.userId;
  }

  Future<bool> signUp(String email, String password) async {
    return authenticate(email, password, AuthMode.signUp);
  }

  Future<bool> login(String email, String password) async {
    return authenticate(email, password, AuthMode.login);
  }

  Future<bool> authenticate(
      String email, String password, AuthMode authMode) async {
    try {
      _user = await _authenticateUseCase.execute(email, password, authMode);
      errorMessage = '';

      return true;
    } on HttpException catch (error) {
      errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is alredy in user.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address.';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'The password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'The password is incorrect.';
      }
    } catch (error) {
      errorMessage = 'could not authenticate you. Please try again later.';
    }
    return false;
  }

  void _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'email': _user.email,
      'token': _user.token,
      'userId': _user.userId,
      'expiryDate': _user.expiryDate?.toIso8601String()
    });
    prefs.setString('userData', userData);
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    try {
      final encodedUserData = prefs.getString('userData');
      final extractedUserData =
          json.decode(encodedUserData!) as Map<String, dynamic>;
      final expiryDate =
          DateTime.parse(extractedUserData['expiryDate'] as String);
      if (expiryDate.isBefore(DateTime.now())) {
        return false;
      }
      _user = User(
          email: extractedUserData['email'] as String,
          userId: extractedUserData['userId'] as String,
          token: extractedUserData['token'] as String,
          expiryDate: expiryDate);
      notifyListeners();
      _autoLogout();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<void> logout() async {
    _user = User(email: '', userId: '', token: '', expiryDate: null);
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    errorMessage = '';
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout() {
    if (_user.expiryDate == null) return;
    if (_authTimer != null) _authTimer!.cancel();
    final timeToExpiry = _user.expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
