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
