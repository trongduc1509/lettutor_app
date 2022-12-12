part of 'register_bloc.dart';

abstract class RegisterState {
  const RegisterState();
}

class RegisterInitState extends RegisterState {
  const RegisterInitState();
}

class RegisterValidateState extends RegisterState {
  const RegisterValidateState({
    required this.email,
    required this.password,
    required this.buttonState,
  });

  final String email;
  final String password;
  final Set<ButtonState> buttonState;
}

class RegisterProcessingState extends RegisterState {
  const RegisterProcessingState();
}

class RegisterDoneState extends RegisterState {
  const RegisterDoneState();
}

class RegisterErrorState extends RegisterState {
  const RegisterErrorState({
    required this.exception,
  });

  final AppException exception;
}
