import 'package:custom_state/custom_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';
import 'package:lettutor_app/feature/authentication/domain/enities/token_entity.dart';
import 'package:lettutor_app/feature/authentication/domain/usecases/login_with_password_usecase/login_with_password.usecase.dart';
import 'package:lettutor_app/shared/managers/events_manager.dart';

import '../../../../../shared/managers/app_manager.dart';
import '../../../domain/repositories/authentication_repository.dart';
import '../../../domain/usecases/login_with_password_usecase/login_with_password_params.usecase.dart';
import '../../../../../di/di_module.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitialState()) {
    on<LoginInitialEvent>(_onInitial);
    on<LoginValidateEvent>(_onValidate);
    on<LoginSendEvent>(_onLogin);
  }

  final AuthenticationRepository _authRepo =
      getIt.get<AuthenticationRepository>();
  final LoginWithPasswordUseCase _loginWithPass = LoginWithPasswordUseCase(
    authRepo: getIt.get<AuthenticationRepository>(),
  );

  void _onInitial(LoginInitialEvent event, emit) {}

  void _onValidate(LoginValidateEvent event, emit) {
    emit(LoginValidateState(
      email: event.email,
      password: event.password,
      buttonState: event.email.isNotEmpty &&
              RegExp(
                r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
              ).hasMatch(event.email) &&
              event.password.isNotEmpty
          ? {ButtonState.initial}
          : {ButtonState.forceDisabled},
    ));
  }

  void _onLogin(LoginSendEvent event, emit) async {
    emit(const LoginProcessingState());
    final result = await _loginWithPass(
      LoginWithPasswordUseCaseParams(
        email: event.email,
        password: event.password,
      ),
    );

    await result.fold(
      (l) => emit(LoginErrorState(exception: l)),
      (r) async {
        await _authRepo.saveSession(
          accessToken: r.accessToken ?? TokenEntity.expired(),
          refreshToken: r.refreshToken ?? TokenEntity.expired(),
        );
        AppManager.shared.appState.add(AppState.authenticated);
        EventsManager()
            .sessionExpired
            .add(r.refreshToken?.expDate ?? DateTime.now());
        emit(const LoginDoneState());
      },
    );
  }
}
