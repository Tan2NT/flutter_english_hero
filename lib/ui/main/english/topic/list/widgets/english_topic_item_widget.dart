import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/ui/main/english/topic/details/english_topic_item_details_screen.dart';
import 'package:english_hero/ui/components/placehoder_image.dart';
import 'package:flutter/material.dart';

class EnglishTopicItemWidget extends StatelessWidget {
  final EnglishTopic _englishTopic;

  EnglishTopicItemWidget(this._englishTopic);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(EnglishTopicItemDetailsScreen.routeName,
            arguments: _englishTopic);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.94,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Colors.white,
          elevation: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(2.0),
                width: MediaQuery.of(context).size.width * 0.28,
                height: MediaQuery.of(context).size.width * 0.28,
                child: Center(
                  child: PlacehoderImage(
                      'assets/images/english_hero.jpg', _englishTopic.imageUrl),
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
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
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
      ),
    );
  }
}