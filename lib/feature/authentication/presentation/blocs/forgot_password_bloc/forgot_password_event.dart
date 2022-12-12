part of 'forgot_password_bloc.dart';

abstract class ForgotPassEvent {
  const ForgotPassEvent();
}

class ForgotPassValidateEvent extends ForgotPassEvent {
  const ForgotPassValidateEvent({
    required this.email,
  });

  final String email;
}

class ForgotPassSendEvent extends ForgotPassEvent {
  const ForgotPassSendEvent({
    required this.email,
  });

  final String email;
}
