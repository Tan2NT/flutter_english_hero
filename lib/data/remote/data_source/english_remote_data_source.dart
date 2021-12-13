import 'package:english_hero/data/common/model/english/vocabulary.dart';
import 'package:english_hero/data/remote/api/english/english_api_service.dart';
import 'package:english_hero/data/remote/api/user/user_api_service.dart';
import '.././../common/model/english/topic_entity.dart';

abstract class EnglishRemoteDataSource {
  Future<List<EnglishTopicEntity>> fetchAllTopics(String authToken);
  Future<List<VocabularyEntity>> fetchVocabulariesByTopic(
      int topicId, String authToken);
}

class EnglishRemoteDataSourceImpl extends EnglishRemoteDataSource {
  final EnglishApiService englishApiService;

  EnglishRemoteDataSourceImpl(this.englishApiService);

  @override
  Future<List<EnglishTopicEntity>> fetchAllTopics(String authToken) async {
    return await englishApiService.fetchAllTopics(authToken);
  }

  @override
  Future<List<VocabularyEntity>> fetchVocabulariesByTopic(
      int topicId, String authToken) async {
    return await englishApiService.fetchVocabulariesByTopic(topicId, authToken);
  }
}
