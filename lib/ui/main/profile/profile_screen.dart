// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:english_hero/presentation/provider/user_provider.dart';
import 'package:english_hero/ui/base/base_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    isBackButton(false);
    appBarTitle('profile'.tr());
    super.initState();
  }

  @override
  Widget body() {
    final user = Provider.of<UserProvider>(context);
    return Center(
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/english_hero.jpg')),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'welcome'.tr() + ', ',
                  style: const TextStyle(color: Colors.blue, fontSize: 24),
                ),
                Text(user.userName,
                    style: const TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                const Text(
                  ' !',
                  style: TextStyle(color: Colors.blue, fontSize: 24),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void isBackButton(bool isBack) {
    super.isBackButton(isBack);
  }

  @override
  void appBarTitle(String title) {
    super.appBarTitle(title);
  }
}
