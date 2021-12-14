import 'package:english_hero/ui/components/app_drawer.dart';
import 'package:english_hero/ui/components/app_top_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'Profile', false),
      drawer: AppDrawer(),
      body: const Center(
        child: Text('This is a profile screen!'),
      ),
    );
  }
}
