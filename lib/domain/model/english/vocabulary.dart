class Vocabulary {
  String word;
  String meaningVi;
  int topicId;

  Vocabulary(
      {required this.word, required this.meaningVi, required this.topicId});

  factory Vocabulary.fromJson(Map<String, dynamic> data) {
    return Vocabulary(
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
