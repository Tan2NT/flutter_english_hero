import 'package:english_hero/domain/mapper/english/english_topics_mapper.dart';

import '../../model/english/topic.dart';
import '../../../data/remote/data_source/english_remote_data_source.dart';

abstract class EnglishTopicRepository {
  Future<List<EnglishTopic>> fetchAllTopics(String authToken);
}

class EnglishTopicRepositoryimpl extends EnglishTopicRepository {
  EnglishRemoteDataSource englishRemoteDataSource;

  EnglishTopicRepositoryimpl(this.englishRemoteDataSource);

  @override
  Future<List<EnglishTopic>> fetchAllTopics(String authToken) async {
    final topics = (await englishRemoteDataSource.fetchAllTopics(authToken))
        .map((topicEntity) => EnglishToPicMapper().mapFromEntity(topicEntity))
        .toList();
    return topics;
  }
}
