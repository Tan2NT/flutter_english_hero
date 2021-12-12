import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final String _title;

  MyAppBar(this._title)
      : super(
          backgroundColor: Colors.purple,
          title: Center(
            child: Text(
              _title,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          elevation: 0.0,
          automaticallyImplyLeading: false,
        );
}
