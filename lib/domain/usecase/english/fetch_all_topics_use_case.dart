import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/domain/repository/english/english_repository.dart';

class FetchAllTopicsUseCase {
  final EnglishRepository _englishRepo;

  FetchAllTopicsUseCase(this._englishRepo);

  Future<List<EnglishTopic>> execute(String authToken) async {
    return await _englishRepo.fetchAllTopics(authToken);
  }
}
