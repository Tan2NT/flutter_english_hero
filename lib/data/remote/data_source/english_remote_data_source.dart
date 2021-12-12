import 'package:english_hero/data/remote/api/english/english_api_service.dart';
import 'package:english_hero/data/remote/api/user/user_api_service.dart';
import '.././../common/model/english/topic_entity.dart';

abstract class EnglishRemoteDataSource {
  Future<List<EnglishTopicEntity>> fetchAllTopics(String authToken);
}

class EnglishRemoteDataSourceImpl extends EnglishRemoteDataSource {
  final EnglishApiService englishApiService;

  EnglishRemoteDataSourceImpl(this.englishApiService);

  @override
  Future<List<EnglishTopicEntity>> fetchAllTopics(String authToken) async {
    return await englishApiService.fetchAllTopics(authToken);
  }
}
