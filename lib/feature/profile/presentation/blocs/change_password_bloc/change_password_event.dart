part of 'change_password_bloc.dart';

abstract class ChangePassEvent {
  const ChangePassEvent();
}

class ChangePassSendEvent extends ChangePassEvent {
  const ChangePassSendEvent({
    required this.currentPass,
    required this.newPass,
  });

  final String currentPass;
  final String newPass;
}

class ChangePassValidateEvent extends ChangePassEvent {
  const ChangePassValidateEvent({
    required this.currentPass,
    required this.newPass,
    required this.confirmPass,
  });

  final String currentPass;
  final String newPass;
  final String confirmPass;
}
