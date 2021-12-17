import 'dart:async';

import 'package:english_hero/application/app.dart';
import 'package:flutter/material.dart';
import 'package:english_hero/di/injection/injetion.dart';
import 'package:english_hero/core/exception/utils/shared_preference_util.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Injection.inject();
    await PreferenceUtils.init();

    runApp(const Application());
  }, (obj, StackTrace stack) {});
}
