import 'package:english_hero/di/injection/injetion.dart';
import 'package:english_hero/presentation/english/topic/details/english_topic_item_details_view_model.dart';
import 'package:english_hero/presentation/english/topic/list/english_topics_view_model.dart';
import 'package:english_hero/presentation/utils/shared_preference_util.dart';
import 'package:english_hero/ui/english/topic/details/english_topic_item_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../presentation/provider/user_provider.dart';
import '../ui/helpers/custom_route.dart';
import '../ui/english/topic/list/english_topics_screen.dart';
import '../ui/splash_screen.dart';
import '../ui/authentication/auth_screen.dart';

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
                accentColor: Colors.deepOrange,
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
                            : AuthScreen()),
            routes: {
              EnglishTopicsScreen.routeName: (ctx) =>
                  EnglishTopicsScreen(getIt.get<EnglishTopicsViewModel>()),
              AuthScreen.routeName: (ctx) => AuthScreen(),
              EnglishTopicItemDetailsScreen.routeName: (ctx) =>
                  EnglishTopicItemDetailsScreen(
                      getIt.get<EnglishTopicItemDetailsViewModel>())
            },
          ),
        ));
  }
}
