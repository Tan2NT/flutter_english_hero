import 'dart:async';

import 'package:english_hero/application/app.dart';
import 'package:flutter/material.dart';
import 'package:english_hero/di/injection/injetion.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Injection.inject();

    runApp(const Application());
  }, (obj, StackTrace stack) {});
}
