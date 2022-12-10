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

class LoginDoneState {
  const LoginDoneState();
}

class LoginErrorState {
  const LoginErrorState();
}
