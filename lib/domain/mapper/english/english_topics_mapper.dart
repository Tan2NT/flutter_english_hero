import '../mapper.dart';
import '../../model/english/topic.dart';
import '../../../data/common/model/english/topic_entity.dart';

class EnglishToPicMapper implements Mapper<EnglishTopicEntity, EnglishTopic> {
  @override
  EnglishTopic mapFromEntity(EnglishTopicEntity topicEntity) {
    return EnglishTopic(
        id: topicEntity.id,
        name: topicEntity.name,
        descriptionEn: topicEntity.descriptionEn,
        imageUrl: topicEntity.imageUrl,
        vocabularyCount: topicEntity.vocabularyCount);
  }

  @override
  EnglishTopicEntity mapToEntity(EnglishTopic topic) {
    return EnglishTopicEntity(
        id: topic.id,
        name: topic.name,
        descriptionEn: topic.descriptionEn,
        imageUrl: topic.imageUrl,
        vocabularyCount: topic.vocabularyCount);
  }
}
