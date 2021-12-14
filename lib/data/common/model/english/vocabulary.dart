class VocabularyEntity {
  String word;
  String meaningVi;
  int topicId;

  VocabularyEntity(
      {required this.word, required this.meaningVi, required this.topicId});

  factory VocabularyEntity.fromJson(Map<String, dynamic> data) {
    return VocabularyEntity(
      word: data['word'],
      meaningVi: data['meaning_vi'],
      topicId: data['topic_id'],
    );
  }

  Map<String, Object> toMap() {
    return <String, Object>{
      'word': word,
      'meaning_vi': meaningVi,
      'topic_id': topicId,
    };
  }

  factory VocabularyEntity.fromMap(Map<dynamic, dynamic> map) {
    return VocabularyEntity(
        word: map['word'] as String,
        meaningVi: map['meaning_vi'] as String,
        topicId: map['topic_id'] as int);
  }
}
