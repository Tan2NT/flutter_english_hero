import 'package:english_hero/data/common/model/english/vocabulary.dart';
import 'package:english_hero/data/remote/api/base/api_base_helper.dart';
import '../../../common/model/english/topic_entity.dart';
import 'dart:async';

class EnglishApiService extends ApiBaseHelper {
  static const BASE_URL =
      'https://flutter-english-hero-default-rtdb.firebaseio.com';
  final TOPICS_SERVICE_NAME = "topics";
  final VOCABULARIES_SERVICE_NAME = "vocabularies";

  Future<List<EnglishTopicEntity>> fetchAllTopics(String authToken) async {
    final url =
        Uri.parse('$BASE_URL/$TOPICS_SERVICE_NAME.json?auth=$authToken');
    try {
      final extractedData =
          await performRequest(RequestMethod.GET, url) as List<dynamic>;
      if (extractedData == null) {
        return [];
      }
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
        '$BASE_URL/$VOCABULARIES_SERVICE_NAME/$topicId.json?auth=$authToken');
    try {
      final extractedData =
          await performRequest(RequestMethod.GET, url) as List<dynamic>;

      if (extractedData == null) {
        return [];
      }
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
