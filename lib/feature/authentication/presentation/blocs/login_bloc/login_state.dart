part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {
  const LoginInitialState();
}

class LoginValidateState extends LoginState {
  const LoginValidateState({
    required this.email,
    required this.password,
    required this.buttonState,
  });

  final String email;
  final String password;
  final Set<ButtonState> buttonState;
}

class LoginProcessingState extends LoginState {
  const LoginProcessingState();
}

class LoginDoneState extends LoginState {
  const LoginDoneState();
}

class LoginErrorState extends LoginState {
  const LoginErrorState({
    required this.exception,
  });

  final AppException exception;
}
