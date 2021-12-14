class EnglishTopicEntity {
  int id;
  String name;
  String descriptionEn;
  String imageUrl;

  EnglishTopicEntity(
      {required this.id,
      required this.name,
      required this.descriptionEn,
      required this.imageUrl});

  factory EnglishTopicEntity.fromJson(Map<dynamic, dynamic> topicData) {
    return EnglishTopicEntity(
        id: topicData['id'] as int,
        name: topicData['name'] as String,
        descriptionEn: topicData['description_en'] as String,
        imageUrl: topicData['image_url'] as String);
  }

  Map<String, Object> toMap() {
    return <String, Object>{
      'id': id,
      'name': name,
      'description_en': descriptionEn,
      'image_url': imageUrl
    };
  }

  factory EnglishTopicEntity.fromMap(Map<dynamic, dynamic> map) {
    return EnglishTopicEntity(
        id: map['id'] as int,
        name: map['name'] as String,
        descriptionEn: map['description_en'] as String,
        imageUrl: map['image_url'] as String);
  }
}
