import 'dart:math';
import 'package:english_hero/domain/model/english/vocabulary.dart';
import 'package:flutter/material.dart';

class EnglishTopicItemDetailsWidget extends StatefulWidget {
  final Vocabulary _vocabulary;

  EnglishTopicItemDetailsWidget(this._vocabulary);

  @override
  _EnglishTopicItemDetailsWidgetState createState() =>
      _EnglishTopicItemDetailsWidgetState();
}

class _EnglishTopicItemDetailsWidgetState
    extends State<EnglishTopicItemDetailsWidget> {
  Color _bgColor = Colors.green;

  @override
  void initState() {
    const availableColors = [
      Colors.purple,
      Colors.green,
      Colors.yellow,
      Colors.blue
    ];
    _bgColor = availableColors[Random().nextInt(availableColors.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _bgColor,
            radius: 30,
          ),
          title: Text(
            widget._vocabulary.word,
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
            widget._vocabulary.meaningVi,
          ),
        ));
  }
}
