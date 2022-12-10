import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../feature/authentication/presentation/views/login_view/login_page.dart';
import '../../../feature/home/home_page.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final BehaviorSubject<String> currentScreen = BehaviorSubject();

  static Route createAuthRoute({
    Route? continueRoute,
  }) =>
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

  static Route createHomeRoute({
    Route? continueRoute,
  }) =>
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
}
