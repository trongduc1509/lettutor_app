import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lettutor_app/base/define/interface/auth_interface/auth.dart';
import 'package:lettutor_app/feature/authentication/domain/enities/token_entity.dart';
import 'package:lettutor_app/feature/authentication/domain/repositories/authentication_repository.dart';
import 'package:lettutor_app/feature/authentication/domain/usecases/refresh_token_usecase/refresh_token_params.usecase.dart';
import 'package:lettutor_app/feature/initialization/presentation/blocs/initialization_event.dart';
import 'package:lettutor_app/feature/initialization/presentation/blocs/initialization_state.dart';
import 'package:lettutor_app/shared/managers/app_manager.dart';
import 'package:lettutor_app/shared/managers/events_manager.dart';

import '../../../../base/define/apigateway/exception/api_exception.dart';

class InitializationBloc
    extends Bloc<InitializationEvent, InitializationState> {
  InitializationBloc({required AuthenticationRepository authRepo})
      : _authRepo = authRepo,
        super(const InitializationState()) {
    on<InitializationInitEvent>(_onInit);
    on<InitializationAuthenEvent>(_onAuthen);
    add(const InitializationAuthenEvent());
  }

  final AuthenticationRepository _authRepo;

  void _onInit(InitializationInitEvent event, emit) {}

  void _onAuthen(InitializationAuthenEvent event, emit) async {
    TokenEntity? accessToken;
    TokenEntity? refreshToken;
    try {
      accessToken = await _authRepo.activateSavedToken();
      refreshToken = _authRepo.getRefreshToken();
      if (accessToken != null && refreshToken != null) {
        log('save session is good');
        final loginResponse = await _authRepo.refreshToken(
            RefreshTokenUseCaseParams(refreshToken: refreshToken.tokenDetail));
        await _authRepo.saveSession(
            accessToken: accessToken, refreshToken: refreshToken);
        emit(state.copyWith(
          authenticationState: AuthenticationState.authenicated,
        ));
        AppManager.shared.appState.add(AppState.authenticated);
        return;
      }
      emit(state.copyWith(
        authenticationState: AuthenticationState.unauthenicated,
      ));
      AppManager.shared.appState.add(AppState.unauthenticated);
    } on Error catch (e) {
      log('Check authentication error: $e');
      if (await InternetConnectionChecker().hasConnection) {
        await _authRepo.clearUserData().catchError((_error) {
          log('Clear user data error: $_error');
        });
        emit(state.copyWith(
          authenticationState: AuthenticationState.unauthenicated,
        ));
        AppManager.shared.appState.add(AppState.unauthenticated);
        if (e is ApiException && e.statusCode == 401) {
          EventsManager().sessionExpired.add(DateTime.now());
        }
      } else if (accessToken != null) {
        emit(state.copyWith(
          authenticationState: AuthenticationState.authenicated,
        ));
        AppManager.shared.appState.add(AppState.authenticated);
        AppManager.shared.isRefreshToken.add(false);
      }
    }
  }
}
