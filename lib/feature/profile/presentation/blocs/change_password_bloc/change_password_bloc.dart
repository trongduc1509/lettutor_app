import 'package:custom_state/custom_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../../domain/entities/change_pass_entity.dart';
import '../../../domain/repositories/profile_repository.dart';
import '../../../domain/usecases/change_pass_usecase/change_pass.usecase.dart';
import '../../../domain/usecases/change_pass_usecase/change_pass_params.usecase.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePassBloc extends Bloc<ChangePassEvent, ChangePassState> {
  ChangePassBloc() : super(const ChangePassInitState()) {
    on<ChangePassSendEvent>(_onChangePass);
    on<ChangePassValidateEvent>(_onValidate);
  }

  final ChangePassUseCase _changePassUseCase =
      ChangePassUseCase(getIt.get<ProfileRepository>());

  void _onValidate(ChangePassValidateEvent event, emit) {
    emit(
      ChangePassValidateState(
        buttonState: event.confirmPass == event.newPass &&
                event.newPass.length >= 6 &&
                event.currentPass.isNotEmpty
            ? {ButtonState.initial}
            : {ButtonState.forceDisabled},
      ),
    );
  }

  void _onChangePass(ChangePassSendEvent event, emit) async {
    emit(const ChangePassLoadingState());
    final result = await _changePassUseCase.execute(ChangePassUseCaseParams(
      password: event.currentPass,
      newPassword: event.newPass,
    ));

    result.fold(
      (l) => emit(
        ChangePassErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        ChangePassDoneState(
          result: r,
        ),
      ),
    );
  }
}
