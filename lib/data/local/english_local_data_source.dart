import 'package:english_hero/data/common/model/english/topic_entity.dart';
import 'package:english_hero/data/common/model/english/vocabulary.dart';
import 'package:english_hero/data/local/dao/topic_dao.dart';
import 'package:english_hero/data/local/dao/vocabularies_dao.dart';

abstract class EnglishLocalDataSource {
  Future<List<EnglishTopicEntity>> getTopics();
  Future<void> saveTopics(List<EnglishTopicEntity> topics);

  Future<List<VocabularyEntity>> getVocabulariesBytopic(int topicId);
  Future<void> saveVocabularies(List<VocabularyEntity> vocabularies);
}

class EnglishLocalDataSourceImpl extends EnglishLocalDataSource {
  EnglishTopicDAO _topicDAO;
  EnglishVocabulariesDAO _vocabulariesDAO;

  EnglishLocalDataSourceImpl(this._topicDAO, this._vocabulariesDAO);

  @override
  Future<List<EnglishTopicEntity>> getTopics() async {
    return await _topicDAO.getTopics();
  }

  @override
  Future<void> saveTopics(List<EnglishTopicEntity> topics) async {
    return await _topicDAO.insert(topics);
  }

  @override
  Future<List<VocabularyEntity>> getVocabulariesBytopic(int topicId) async {
    return await _vocabulariesDAO.getVocabulariesByTopic(topicId);
  }

  @override
  Future<void> saveVocabularies(List<VocabularyEntity> vocabularies) async {
    if (vocabularies.isNotEmpty) {
      _topicDAO.updatevocabularyCountOfTopic(
          vocabularies[0].topicId, vocabularies.length);
    }
    return await _vocabulariesDAO.insert(vocabularies);
  }
}
