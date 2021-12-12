import 'package:english_hero/data/common/model/english/topic_entity.dart';
import 'package:english_hero/data/local/dao/topic_dao.dart';

abstract class EnglishLocalDataSource {
  Future<List<EnglishTopicEntity>> getTopics();
  Future<void> saveTopics(List<EnglishTopicEntity> topics);
}

class EnglishLocalDataSourceImpl extends EnglishLocalDataSource {
  EnglishTopicDAO _englishTopicDAO;

  EnglishLocalDataSourceImpl(this._englishTopicDAO);

  @override
  Future<List<EnglishTopicEntity>> getTopics() async {
    return await _englishTopicDAO.getTopics();
  }

  @override
  Future<void> saveTopics(List<EnglishTopicEntity> topics) async {
    return await _englishTopicDAO.insert(topics);
  }
}
