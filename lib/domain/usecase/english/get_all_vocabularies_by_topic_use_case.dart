import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/domain/model/english/vocabulary.dart';
import 'package:english_hero/domain/repository/english/english_repository.dart';

class GetAllVocabulariesByTopicUseCase {
  final EnglishRepository _englishRepo;

  GetAllVocabulariesByTopicUseCase(this._englishRepo);

  Future<List<Vocabulary>> execute(int topicId) async {
    return await _englishRepo.getVocabulariesByTopicId(topicId);
  }
}
