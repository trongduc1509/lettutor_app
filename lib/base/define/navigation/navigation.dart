import 'package:flutter/material.dart';
import 'package:lettutor_app/feature/authentication/login_page.dart';
import 'package:lettutor_app/feature/home/home_page.dart';
import 'package:rxdart/rxdart.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final BehaviorSubject<String> currentScreen = BehaviorSubject();

  static Route createAuthRoute({
    Route? continueRoute,
  }) =>
      MaterialPageRoute(
        builder: (context) => LoginPage(
          continueRoute: continueRoute,
        ),
      );

  static Route createHomeRoute({
    Route? continueRoute,
  }) =>
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
}
