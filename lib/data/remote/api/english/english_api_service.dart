import '../../../common/model/english/topic_entity.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class EnglishApiService {
  static const BASE_URL =
      'https://flutter-english-hero-default-rtdb.firebaseio.com';
  final SERVICE_NAME = "topics";

  Future<List<EnglishTopicEntity>> fetchAllTopics(String authToken) async {
    final url = Uri.parse('$BASE_URL/$SERVICE_NAME.json?auth=$authToken');
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
      rethrow;
    }
  }
}
