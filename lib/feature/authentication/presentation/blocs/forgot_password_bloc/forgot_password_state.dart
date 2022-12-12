part of 'forgot_password_bloc.dart';

abstract class ForgotPassState {
  const ForgotPassState();
}

class ForgotPassInitState extends ForgotPassState {
  const ForgotPassInitState();
}

class ForgotPassValidateState extends ForgotPassState {
  const ForgotPassValidateState({
    required this.email,
    required this.buttonState,
  });

  final String email;
  final Set<ButtonState> buttonState;
}

class ForgotPassProcessingState extends ForgotPassState {
  const ForgotPassProcessingState();
}

class ForgotPassDoneState extends ForgotPassState {
  const ForgotPassDoneState({
    required this.result,
  });

  final ForgotPassEntity result;
}

class ForgotPassErrorState extends ForgotPassState {
  const ForgotPassErrorState({
    required this.exception,
  });

  final AppException exception;
}
