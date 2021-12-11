import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../presentation/user/user_provider.dart';
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
                ? const EnglishTopicsScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (context, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? const SplashScreen()
                            : AuthScreen()),
            routes: {
              EnglishTopicsScreen.routeName: (ctx) =>
                  const EnglishTopicsScreen(),
              AuthScreen.routeName: (ctx) => AuthScreen(),
            },
          ),
        ));
  }
}
