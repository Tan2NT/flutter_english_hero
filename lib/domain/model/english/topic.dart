class EnglishTopic {
  int id;
  String name;
  String descriptionEn;
  String imageUrl;
  int vocabularyCount;

  EnglishTopic(
      {required this.id,
      required this.name,
      required this.descriptionEn,
      required this.imageUrl,
      required this.vocabularyCount});

  Map<String, Object> toMap() {
    return <String, Object>{
      'id': id,
      'name': name,
      'description_en': descriptionEn,
      'image_url': imageUrl,
      'vocabulary_count': vocabularyCount
    };
  }
}

extension ListEnglishTopicExtension on List<EnglishTopic> {
  bool isListEqualIgnoreVocabularyCount(List<EnglishTopic> anotherList) {
    if (length == 0 && anotherList.isEmpty) return true;
    if (length == 0 || anotherList.isEmpty) return false;
    for (var i = 0; i < length; i++) {
      if (this[i].id != anotherList[i].id ||
          this[i].name != anotherList[i].name ||
          this[i].descriptionEn != anotherList[i].descriptionEn ||
          this[i].imageUrl != anotherList[i].imageUrl) return false;
    }
    return true;
  }
}
