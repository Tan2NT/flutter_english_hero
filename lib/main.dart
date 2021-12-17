import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:english_hero/application/app.dart';
import 'package:flutter/material.dart';
import 'package:english_hero/di/injection/injetion.dart';
import 'package:english_hero/core/exception/utils/shared_preference_util.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    await Injection.inject();
    await PreferenceUtils.init();

    runApp(EasyLocalization(
        child: const Application(),
        supportedLocales: const [Locale('en')],
        path: 'assets/translations'));
  }, (obj, StackTrace stack) {});
}
