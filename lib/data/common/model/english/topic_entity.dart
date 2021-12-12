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

  factory EnglishTopicEntity.fromJson(Map<String, dynamic> topicData) {
    return EnglishTopicEntity(
        id: topicData['id'],
        name: topicData['name'],
        descriptionEn: topicData['description_en'],
        imageUrl: topicData['imageUrl']);
  }
}
