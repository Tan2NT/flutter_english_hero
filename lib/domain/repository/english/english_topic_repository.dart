import 'package:english_hero/data/common/model/english/topic_entity.dart';
import 'package:english_hero/data/local/english_local_data_source.dart';
import 'package:english_hero/domain/mapper/english/english_topics_mapper.dart';

import '../../model/english/topic.dart';
import '../../../data/remote/data_source/english_remote_data_source.dart';

abstract class EnglishTopicRepository {
  Future<List<EnglishTopic>> fetchAllTopics(String authToken);
  Future<List<EnglishTopic>> getAllTopics();
  Future<void> saveTopics(List<EnglishTopicEntity> topics);
}

class EnglishTopicRepositoryimpl extends EnglishTopicRepository {
  EnglishRemoteDataSource _remoteDataSource;
  EnglishLocalDataSource _LocalDataSource;

  EnglishTopicRepositoryimpl(this._remoteDataSource, this._LocalDataSource);

  @override
  Future<List<EnglishTopic>> fetchAllTopics(String authToken) async {
    final fetchedTopics = (await _remoteDataSource.fetchAllTopics(authToken));
    saveTopics(fetchedTopics);
    return fetchedTopics
        .map((topicEntity) => EnglishToPicMapper().mapFromEntity(topicEntity))
        .toList();
  }

  @override
  Future<List<EnglishTopic>> getAllTopics() async {
    final topics = (await _LocalDataSource.getTopics())
        .map((topicEntity) => EnglishToPicMapper().mapFromEntity(topicEntity))
        .toList();
    return topics;
  }

  @override
  Future<void> saveTopics(List<EnglishTopicEntity> topics) async {
    return _LocalDataSource.saveTopics(topics);
  }
}
