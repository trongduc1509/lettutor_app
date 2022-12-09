import 'package:flutter/material.dart';

import 'config/main.dart';
import 'di/injection/injection.dart';
import 'feature/authentication/login_page.dart';

void main() async {
  await Injection.inject();
  await configureApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
