import 'package:english_hero/domain/model/english/topic.dart';
import 'package:flutter/material.dart';

class EnglishTopicItemView extends StatelessWidget {
  final EnglishTopic _englishTopic;

  EnglishTopicItemView(this._englishTopic);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.94,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        color: Colors.white70,
        elevation: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(2.0),
              width: MediaQuery.of(context).size.width * 0.28,
              height: MediaQuery.of(context).size.width * 0.28,
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/english_hero.jpg'),
                image: NetworkImage(_englishTopic.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      _englishTopic.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      _englishTopic.descriptionEn,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
