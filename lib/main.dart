import 'package:flutter/material.dart';

import 'app.dart';
import 'config/main.dart';
import 'di/injection/injection.dart';

void main() async {
  await Injection.inject();
  await configureApp();
  runApp(const App());
}
