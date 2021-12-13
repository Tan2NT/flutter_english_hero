import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/domain/model/english/vocabulary.dart';
import 'package:english_hero/domain/usecase/english/fetch_all_topics_use_case.dart';
import 'package:english_hero/domain/usecase/english/fetch_vocabularies_by_topic_use_case.dart';

import 'package:english_hero/domain/usecase/english/get_all_vocabularies_by_topic_use_case.dart';
import 'package:english_hero/presentation/utils/constants.dart';
import 'package:english_hero/presentation/utils/shared_preference_util.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicItemDetailsViewModel extends Model {
  List<Vocabulary> _vocabularies = [];
  final FetchVocabulariesByTopicsUseCase _fetchAllVocabsUseCase;
  final GetAllVocabulariesByTopicUseCase _getVocabulariesByTopicUseCase;

  List<Vocabulary> get vocabularies {
    return _vocabularies;
  }

  EnglishTopicItemDetailsViewModel(
      this._fetchAllVocabsUseCase, this._getVocabulariesByTopicUseCase);

  Future<List<Vocabulary>> fetchVocabulariesByTopics(int topicId) async {
    final fetchedVocabularies = await _fetchAllVocabsUseCase.execute(
        topicId, PreferenceUtils.getString(Constants.USER_TOKEN_KEY));
    updateVocabularies(fetchedVocabularies);
    return fetchedVocabularies;
  }

  Future<List<Vocabulary>> getAllTVocabulariesByTopic(int topicId) async {
    final savedVocabularies =
        await _getVocabulariesByTopicUseCase.execute(topicId);
    updateVocabularies(savedVocabularies);
    return savedVocabularies;
  }

  void updateVocabularies(List<Vocabulary> newTopics) {
    if (newTopics.isNotEmpty) {
      _vocabularies.clear();
      _vocabularies = newTopics;
      notifyListeners();
    }
  }
}
