import 'package:english_hero/domain/model/english/topic.dart';
import 'package:flutter/material.dart';

class EnglishTopicItemView extends StatelessWidget {
  final EnglishTopic _englishTopic;

  EnglishTopicItemView(this._englishTopic);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: FadeInImage(
            placeholder: AssetImage('assets/images/english_hero.jpg'),
            image: NetworkImage(_englishTopic.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          _englishTopic.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(_englishTopic.descriptionEn),
      ),
    );
  }
}
