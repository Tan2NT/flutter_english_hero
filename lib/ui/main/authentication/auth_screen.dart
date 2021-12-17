import 'package:flutter/material.dart';
import 'dart:math';
import 'auth_card.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    transformConfig.translate(-10.0);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      const Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                      const Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0, 1])),
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: deviceSize.width,
              height: deviceSize.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 70.0),
                    transform: Matrix4.rotationZ(-8 * pi / 180)
                      ..translate(-10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepOrange.shade900,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 8,
                              color: Colors.black26,
                              offset: Offset(0, 2))
                        ]),
                    child: Text(
                      'English Hero',
                      style: TextStyle(
                          color: Theme.of(context)
                              // ignore: deprecated_member_use
                              .accentTextTheme
                              .headline6!
                              .color,
                          fontSize: 40,
                          fontFamily: 'Anton',
                          fontWeight: FontWeight.normal),
                    ),
                  )),
                  Flexible(
                    child: const AuthCard(),
                    flex: deviceSize.width > 600 ? 2 : 1,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
