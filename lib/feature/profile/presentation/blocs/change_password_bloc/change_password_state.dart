part of 'change_password_bloc.dart';

abstract class ChangePassState {
  const ChangePassState();
}

class ChangePassInitState extends ChangePassState {
  const ChangePassInitState();
}

class ChangePassValidateState extends ChangePassState {
  const ChangePassValidateState({
    required this.buttonState,
  });

  final Set<ButtonState> buttonState;
}

class ChangePassLoadingState extends ChangePassState {
  const ChangePassLoadingState();
}

class ChangePassDoneState extends ChangePassState {
  const ChangePassDoneState({
    required this.result,
  });

  final ChangePassEntity result;
}

class ChangePassErrorState extends ChangePassState {
  const ChangePassErrorState({
    required this.exception,
  });

  final AppException exception;
}
