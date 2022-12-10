import 'package:flutter/material.dart';

import 'base/define/navigation/navigation.dart';
import 'feature/initialization/presentation/views/initialization_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom LetTutor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}
