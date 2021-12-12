import 'package:flutter/cupertino.dart';

class EnglishTopic {
  int id;
  String name;
  String descriptionEn;
  String imageUrl;

  EnglishTopic(
      {required this.id,
      required this.name,
      required this.descriptionEn,
      required this.imageUrl});

  Map<String, Object> toMap() {
    return <String, Object>{
      'id': id,
      'name': name,
      'description_en': descriptionEn,
      'image_url': imageUrl
    };
  }
}
