import 'package:english_hero/data/common/model/english/vocabulary.dart';
import 'package:english_hero/data/remote/api/base/api_base_helper.dart';
import '../../../common/model/english/topic_entity.dart';
import 'dart:async';

class EnglishApiService extends ApiBaseHelper {
  final baseUrl = 'https://flutter-english-hero-default-rtdb.firebaseio.com';
  final topicsServiceName = "topics";
  final vocabulariesServiceName = "vocabularies";

  Future<List<EnglishTopicEntity>> fetchAllTopics(String authToken) async {
    final url = Uri.parse('$baseUrl/$topicsServiceName.json?auth=$authToken');
    try {
      final extractedData =
          await performRequest(RequestMethod.get, url) as List<dynamic>;
      List<EnglishTopicEntity> topics = [];
      for (var tocpicData in extractedData) {
        topics.add(EnglishTopicEntity.fromJson(tocpicData));
      }
      return topics;
    } catch (error) {
      return [];
    }
  }

  Future<List<VocabularyEntity>> fetchVocabulariesByTopic(
      int topicId, String authToken) async {
    final url = Uri.parse(
        '$baseUrl/$vocabulariesServiceName/$topicId.json?auth=$authToken');
    try {
      final extractedData =
          await performRequest(RequestMethod.get, url) as List<dynamic>;
      List<VocabularyEntity> vocabularies = [];
      for (var vocabularyData in extractedData) {
        vocabularies.add(VocabularyEntity.fromJson(vocabularyData));
      }
      return vocabularies;
    } catch (error) {
      return [];
    }
  }
}
