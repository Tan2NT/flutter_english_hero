import 'package:english_hero/di/injection/injetion.dart';
import 'package:english_hero/presentation/english/topic/details/english_topic_item_details_view_model.dart';
import 'package:english_hero/presentation/english/topic/list/english_topics_view_model.dart';
import 'package:english_hero/presentation/english/topic/test/english_topic_test_view_model.dart';
import 'package:english_hero/ui/main/english/topic/details/english_topic_item_details_screen.dart';
import 'package:english_hero/ui/main/english/topic/list/english_topics_screen.dart';
import 'package:english_hero/ui/main/english/topic/test/english_topic_test_screen.dart';
import 'package:english_hero/ui/main/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../presentation/provider/user_provider.dart';
import '../ui/helpers/custom_route.dart';
import '../ui/main/splash_screen.dart';
import '../ui/main/authentication/auth_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => GetIt.instance.get<UserProvider>()),
        ],
        child: Consumer<UserProvider>(
          builder: (ctx, auth, _) => MaterialApp(
            title: 'English Hero',
            theme: ThemeData(
                primarySwatch: Colors.purple,
                primaryColorDark: Colors.deepOrange,
                fontFamily: 'Lato',
                pageTransitionsTheme: PageTransitionsTheme(builders: {
                  TargetPlatform.android: CustomPageTransitionBuilder(),
                  TargetPlatform.iOS: CustomPageTransitionBuilder()
                })),
            home: auth.isAuth
                ? EnglishTopicsScreen(getIt.get<EnglishTopicsViewModel>())
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (context, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? const SplashScreen()
                            : const AuthScreen()),
            routes: {
              EnglishTopicsScreen.routeName: (ctx) =>
                  EnglishTopicsScreen(getIt.get<EnglishTopicsViewModel>()),
              AuthScreen.routeName: (ctx) => const AuthScreen(),
              EnglishTopicItemDetailsScreen.routeName: (ctx) =>
                  EnglishTopicItemDetailsScreen(
                      getIt.get<EnglishTopicItemDetailsViewModel>()),
              ProfileScreen.routeName: (ctx) => const ProfileScreen(),
              EnglishTopicTestScreen.routeName: (ctx) =>
                  EnglishTopicTestScreen(getIt.get<EnglishTopicTestViewModel>())
            },
          ),
        ));
  }
}
