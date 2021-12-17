import 'package:english_hero/presentation/provider/user_provider.dart';
import 'package:english_hero/ui/main/authentication/auth_screen.dart';
import 'package:english_hero/ui/main/english/topic/list/english_topics_screen.dart';
import 'package:english_hero/ui/main/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
              title: const Text('English Hero!'),
              automaticallyImplyLeading: false),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Study'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(EnglishTopicsScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_pin_rounded),
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProfileScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
              Provider.of<UserProvider>(context, listen: false).logout();
            },
          )
        ],
      ),
    );
  }
}
