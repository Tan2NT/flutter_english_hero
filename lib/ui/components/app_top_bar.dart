import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar(BuildContext context, String title, bool canGoBack, {Key? key})
      : super(
          key: key,
          backgroundColor: Theme.of(context).primaryColor,
          leading: canGoBack
              ? IconButton(
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios))
              : const Text(''),
          title: Center(
            child: Text(
              title,
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
