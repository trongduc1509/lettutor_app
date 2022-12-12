import 'package:custom_state/custom_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/authentication/domain/enities/forgot_pass_entity.dart';
import 'package:lettutor_app/feature/authentication/domain/usecases/forgot_password_usecase/forgot_password_params.usecase.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../../domain/repositories/authentication_repository.dart';
import '../../../domain/usecases/forgot_password_usecase/forgot_password.usecase.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  ForgotPassBloc() : super(const ForgotPassInitState()) {
    on<ForgotPassValidateEvent>(_onValidate);
    on<ForgotPassSendEvent>(_onSend);
    add(const ForgotPassValidateEvent(email: ''));
  }

  final ForgotPassUseCase _forgotPassUseCase = ForgotPassUseCase(
    authRepo: getIt.get<AuthenticationRepository>(),
  );

  void _onValidate(ForgotPassValidateEvent event, emit) {
    emit(ForgotPassValidateState(
      email: event.email,
      buttonState: event.email.isNotEmpty &&
              RegExp(
                r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
              ).hasMatch(event.email)
          ? {ButtonState.initial}
          : {ButtonState.forceDisabled},
    ));
  }

  void _onSend(ForgotPassSendEvent event, emit) async {
    emit(const ForgotPassProcessingState());
    final result = await _forgotPassUseCase(ForgotPassUseCaseParams(
      email: event.email,
    ));

    result.fold(
      (l) => emit(ForgotPassErrorState(
        exception: l,
      )),
      (r) => emit(ForgotPassDoneState(
        result: r,
      )),
    );
  }
}
