import 'package:english_hero/data/common/model/english/vocabulary.dart';
import 'package:english_hero/domain/model/english/vocabulary.dart';

import '../mapper.dart';

class EnglishVocabularyMapper implements Mapper<VocabularyEntity, Vocabulary> {
  @override
  Vocabulary mapFromEntity(VocabularyEntity vocabEntity) {
    return Vocabulary(
      word: vocabEntity.word,
      meaningVi: vocabEntity.meaningVi,
      topicId: vocabEntity.topicId,
    );
  }

  @override
  VocabularyEntity mapToEntity(Vocabulary vocab) {
    return VocabularyEntity(
        word: vocab.word, meaningVi: vocab.meaningVi, topicId: vocab.topicId);
  }
}
