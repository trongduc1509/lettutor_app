import 'package:custom_state/custom_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../../../../shared/managers/app_manager.dart';
import '../../../../../shared/managers/events_manager.dart';
import '../../../domain/enities/token_entity.dart';
import '../../../domain/repositories/authentication_repository.dart';
import '../../../domain/usecases/register_with_email_pass_usecase/register_email_pass.usecase.dart';
import '../../../domain/usecases/register_with_email_pass_usecase/register_email_pass_params.usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterInitState()) {
    on<RegisterInitEvent>(_onInit);
    on<RegisterValidateEvent>(_onValidate);
    on<RegisterSendEvent>(_onRegister);
    add(
      const RegisterValidateEvent(
        email: '',
        password: '',
      ),
    );
  }

  final AuthenticationRepository _authRepo =
      getIt.get<AuthenticationRepository>();
  final RegisterEmailPassUseCase _registerEmailPass = RegisterEmailPassUseCase(
    authRepo: getIt.get<AuthenticationRepository>(),
  );

  void _onInit(RegisterInitEvent event, emit) {}

  void _onValidate(RegisterValidateEvent event, emit) {
    emit(RegisterValidateState(
      email: event.email,
      password: event.password,
      buttonState: event.email.isNotEmpty &&
              RegExp(
                r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
              ).hasMatch(event.email) &&
              event.password.isNotEmpty
          ? {ButtonState.initial}
          : {ButtonState.forceDisabled},
    ));
  }

  void _onRegister(RegisterSendEvent event, emit) async {
    emit(const RegisterProcessingState());
    final result = await _registerEmailPass(
      RegisterEmailPassUseCaseParams(
        email: event.email,
        password: event.password,
      ),
    );

    await result.fold(
      (l) => emit(RegisterErrorState(exception: l)),
      (r) async {
        await _authRepo.saveSession(
          accessToken: r.accessToken ?? TokenEntity.expired(),
          refreshToken: r.refreshToken ?? TokenEntity.expired(),
        );
        AppManager.shared.appState.add(AppState.authenticated);
        EventsManager()
            .sessionExpired
            .add(r.refreshToken?.expDate ?? DateTime.now());
        emit(const RegisterDoneState());
      },
    );
  }
}
