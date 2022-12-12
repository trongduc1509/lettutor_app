import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../feature/authentication/presentation/views/forgot_password_view/forgot_password_page.dart';
import '../../../feature/authentication/presentation/views/login_view/login_page.dart';
import '../../../feature/authentication/presentation/views/register_view/register_page.dart';
import '../../../feature/home/home_page.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final BehaviorSubject<String> currentScreen = BehaviorSubject();

  static Route createLoginRoute({
    Route? continueRoute,
  }) =>
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

  static Route createRegisterRoute() => MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      );

  static Route createForgotPasswordRoute() => MaterialPageRoute(
        builder: (context) => const ForgotPasswordPage(),
      );

  static Route createHomeRoute({
    Route? continueRoute,
  }) =>
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
}
