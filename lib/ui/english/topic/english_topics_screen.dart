import 'package:flutter/material.dart';

class EnglishTopicsScreen extends StatelessWidget {
  const EnglishTopicsScreen({Key? key}) : super(key: key);

  static const routeName = '/english-topics';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('English Topics screen'),
      ),
    );
  }
}
