import 'package:custom_state/custom_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final result =
        await _authRepo.loginWithPassword(LoginWithPasswordUseCaseParams(
      email: event.email,
      password: event.password,
    ));

    //result.fold((l) => null, (r) => null)
  }
}
