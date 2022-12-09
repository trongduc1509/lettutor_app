import 'package:rxdart/rxdart.dart';

enum AppState { initial, unauthenticated, authenticated }

extension AppStateX on AppState {
  bool get isAuthenticated => this == AppState.authenticated;
}

class AppManager {
  static AppManager shared = AppManager();

  final BehaviorSubject<AppState> appState =
      BehaviorSubject.seeded(AppState.initial);

  final BehaviorSubject<bool> isRefreshToken = BehaviorSubject.seeded(true);
}
