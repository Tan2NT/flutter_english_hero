import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/domain/usecase/english/fetch_all_topics_use_case.dart';
import 'package:english_hero/domain/usecase/english/fetch_vocabularies_by_topic_use_case.dart';
import 'package:english_hero/domain/usecase/english/get_all_english_topic_use_case.dart';
import 'package:english_hero/presentation/utils/constants.dart';
import 'package:english_hero/presentation/utils/shared_preference_util.dart';
import 'package:flutter/foundation.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicsViewModel extends Model {
  List<EnglishTopic> englisTopics = [];
  final FetchAllTopicsUseCase _fetchAllTopicsUseCase;
  final GetAllTopicsUseCase _getAllTopicsUseCase;
  final FetchVocabulariesByTopicsUseCase _fetchVocabulariesByTopicsUseCase;

  EnglishTopicsViewModel(this._fetchAllTopicsUseCase, this._getAllTopicsUseCase,
      this._fetchVocabulariesByTopicsUseCase) {
    fetchAllTopics();
    getAllTopics();
  }

  Future<List<EnglishTopic>> fetchAllTopics() async {
    final token = PreferenceUtils.getString(Constants.USER_TOKEN_KEY);
    final fetchedTopics = await _fetchAllTopicsUseCase.execute(token);
    updateTopics(fetchedTopics);
    fetchVocabulariesOfTopics(fetchedTopics, token);
    return fetchedTopics;
  }

  Future fetchVocabulariesOfTopics(
      List<EnglishTopic> topics, String token) async {
    if (topics.isNotEmpty) {
      for (var topic in topics) {
        final vocabs =
            await _fetchVocabulariesByTopicsUseCase.execute(topic.id, token);
        if (vocabs.isNotEmpty) {
          updateVocabularyCountOfTopic(vocabs[0].topicId, vocabs.length);
        }
      }
    }
  }

  Future<List<EnglishTopic>> getAllTopics() async {
    final savedTopics = await _getAllTopicsUseCase.execute();
    updateTopics(savedTopics);
    return savedTopics;
  }

  void updateTopics(List<EnglishTopic> newTopics) {
    if (newTopics.isNotEmpty && !listEquals(newTopics, englisTopics)) {
      englisTopics.clear();
      englisTopics = newTopics;
      notifyListeners();
    }
  }

  void updateVocabularyCountOfTopic(int topicId, vocabularyCount) {
    for (var topic in englisTopics) {
      if (topic.id == topicId) {
        topic.vocabularyCount = vocabularyCount;
        notifyListeners();
      }
    }
  }
}
