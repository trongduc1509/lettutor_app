part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginInitialEvent extends LoginEvent {
  const LoginInitialEvent();
}

class LoginValidateEvent extends LoginEvent {
  const LoginValidateEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class LoginSendEvent extends LoginEvent {
  const LoginSendEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
