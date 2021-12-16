import 'package:english_hero/ui/base/base_page_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends BasePageScreen {
  static const routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BasePageScreenState<ProfileScreen>
    with BaseScreen {
  @override
  void initState() {
    appBarTitle('Profile');
    super.initState();
  }

  @override
  Widget body() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Card(
            elevation: 5,
            child: Center(
              child: Text('Your name here!'),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void appBarTitle(String title) {
    super.appBarTitle(title);
  }
}
