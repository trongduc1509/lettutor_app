part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterInitEvent extends RegisterEvent {
  const RegisterInitEvent();
}

class RegisterValidateEvent extends RegisterEvent {
  const RegisterValidateEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class RegisterSendEvent extends RegisterEvent {
  const RegisterSendEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
