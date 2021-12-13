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
}
