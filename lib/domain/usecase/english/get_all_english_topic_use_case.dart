import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/domain/repository/english/english_topic_repository.dart';

class GetAllTopicsUseCase {
  EnglishTopicRepository _englishTopicRepo;

  GetAllTopicsUseCase(this._englishTopicRepo);

  Future<List<EnglishTopic>> execute() async {
    return await _englishTopicRepo.getAllTopics();
  }
}
