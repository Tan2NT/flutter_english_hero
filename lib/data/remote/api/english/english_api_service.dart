import 'package:english_hero/core/exception/http_exception.dart';
import 'package:english_hero/data/common/model/english/vocabulary.dart';
import 'package:english_hero/di/injection/injetion.dart';
import 'package:english_hero/presentation/provider/user_provider.dart';

import '../../../common/model/english/topic_entity.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class EnglishApiService {
  static const BASE_URL =
      'https://flutter-english-hero-default-rtdb.firebaseio.com';
  final TOPICS_SERVICE_NAME = "topics";
  final VOCABULARIES_SERVICE_NAME = "vocabularies";

  Future<List<EnglishTopicEntity>> fetchAllTopics(String authToken) async {
    final userProvider = getIt.get<UserProvider>();
    print(
        'TDebug - is auth: ${userProvider.isAuth} - user token: ${userProvider.token} ');
    final url =
        Uri.parse('$BASE_URL/$TOPICS_SERVICE_NAME.json?auth=$authToken');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return [];
      }
      List<EnglishTopicEntity> topics = [];
      extractedData.forEach((tocpicData) {
        topics.add(EnglishTopicEntity.fromJson(tocpicData));
      });
      return topics;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<VocabularyEntity>> fetchVocabulariesByTopic(
      int topicId, String authToken) async {
    final url = Uri.parse(
        '$BASE_URL/$VOCABULARIES_SERVICE_NAME/$topicId.json?auth=$authToken');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;

      if (extractedData == null) {
        return [];
      }
      List<VocabularyEntity> vocabularies = [];
      extractedData.forEach((vocabularyData) {
        vocabularies.add(VocabularyEntity.fromJson(vocabularyData));
      });
      return vocabularies;
    } catch (error) {
      return [];
    }
  }
}
