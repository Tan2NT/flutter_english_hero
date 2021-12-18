import 'dart:convert';

import 'package:english_hero/data/common/model/user/user_entity.dart';
import 'package:english_hero/data/remote/api/user/user_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

@GenerateMocks([http.Client])
main() {
  group('singUp', () {
    test(
        'return a User if the authentication request call completes successfully',
        () async {
      final client = MockClient();
      const baseUrl = "https://identitytoolkit.googleapis.com/v1/accounts";
      const apiKey = "AIzaSyCTIVquwOn2K4tmvJYAocEmTHJS4xYfEhI";
      const authMethod = "signUp";

      final url = Uri.parse('$baseUrl:$authMethod?key=$apiKey');

      final loginResponse = {
        "email": "tanhoang@gmail.com",
        "localId": "afadasfasfaf",
        "idToken": "sfdasfdafafalkfjafafl;",
        "expiresIn": 3600
      };

      when(client.post(url,
              body: json.encode({
                'email': "tanhoang@gmail.com",
                'password': "111111",
                'returnSecureToken': true
              })))
          .thenAnswer(
              (_) async => http.Response(json.encode(loginResponse), 200));

      final userApiService = UserApiService();

      expect(await userApiService.signUp("tanhoang@gmail.com", "111111"),
          isA<UserEntity>());
    });
  });
}
