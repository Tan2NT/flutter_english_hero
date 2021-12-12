import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/domain/repository/english/english_topic_repository.dart';

class FetchAllTopicsUseCase {
  EnglishTopicRepository _englishTopicRepo;

  FetchAllTopicsUseCase(this._englishTopicRepo);

  Future<List<EnglishTopic>> execute(String authToken) async {
    return await _englishTopicRepo.fetchAllTopics(authToken);
  }
}
