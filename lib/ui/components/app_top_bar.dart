import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final BuildContext _context;
  final String _title;
  final bool _canGoBack;

  MyAppBar(this._context, this._title, this._canGoBack)
      : super(
          backgroundColor: Theme.of(_context).primaryColor,
          leading: _canGoBack
              ? IconButton(
                  onPressed: () {
                    if (Navigator.of(_context).canPop()) {
                      Navigator.of(_context).pop();
                    }
                  },
                  icon: Icon(Icons.arrow_back_ios))
              : const Text(''),
          title: Center(
            child: Text(
              _title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          elevation: 0.0,
          automaticallyImplyLeading: false,
        );
}
