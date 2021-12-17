import 'package:english_hero/domain/model/english/vocabulary.dart';
import 'package:english_hero/domain/repository/english/english_repository.dart';

class FetchVocabulariesByTopicsUseCase {
  final EnglishRepository _englishRepo;

  FetchVocabulariesByTopicsUseCase(this._englishRepo);

  Future<List<Vocabulary>> execute(int topicId, String authToken) async {
    return await _englishRepo.fetchVocabulariesByTopic(topicId, authToken);
  }
}
