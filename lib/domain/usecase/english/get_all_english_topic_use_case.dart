import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/domain/repository/english/english_repository.dart';

class GetAllTopicsUseCase {
  final EnglishRepository _englishRepo;

  GetAllTopicsUseCase(this._englishRepo);

  Future<List<EnglishTopic>> execute() async {
    return await _englishRepo.getAllTopics();
  }
}
