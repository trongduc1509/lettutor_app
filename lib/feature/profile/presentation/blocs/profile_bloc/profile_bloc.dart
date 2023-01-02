import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../../../../shared/managers/app_manager.dart';
import '../../../../../shared/managers/events_manager.dart';
import '../../../../authentication/domain/repositories/authentication_repository.dart';
import '../../../domain/entities/user_info_entity.dart';
import '../../../domain/repositories/profile_repository.dart';
import '../../../domain/usecases/get_user_info_usecase/get_user_info_usecase.dart';
import '../../../domain/usecases/logout_usecase/logout_usecase.dart';
import '../../../domain/usecases/update_info_usecase/update_info.usecase.dart';
import '../../../domain/usecases/update_info_usecase/update_info_params.usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileInitState()) {
    on<ProfileInitEvent>(_onInit);
    on<ProfileLogoutEvent>(_onLogout);
    on<ProfileUpdateEvent>(_onUpdateInfo);
    // add(const ProfileInitEvent());
  }

  final GetUserInfoUseCase _getUserInfoUseCase = GetUserInfoUseCase(
    profileRepo: getIt.get<ProfileRepository>(),
  );
  final LogoutUseCase _logoutUseCase = LogoutUseCase(
    authRepo: getIt.get<AuthenticationRepository>(),
  );
  final UpdateInfoUseCase _updateInfo =
      UpdateInfoUseCase(getIt.get<ProfileRepository>());

  void _onInit(ProfileInitEvent event, emit) async {
    emit(const ProfileLoadingState());
    final result = await _getUserInfoUseCase(null);

    result.fold(
      (l) => emit(
        ProfileLoadErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        ProfileLoadDoneState(
          userInfo: r,
        ),
      ),
    );
  }

  void _onLogout(ProfileLogoutEvent event, emit) async {
    await _logoutUseCase.execute(null);
    AppManager.shared.appState.add(AppState.unauthenticated);
    EventsManager().sessionExpired.add(DateTime.now());

    emit(const ProfileLogoutState());
  }

  void _onUpdateInfo(ProfileUpdateEvent event, emit) async {
    final result = await _updateInfo.execute(
      UpdateInfoUseCaseParams(
        name: event.name,
        country: event.country,
        phone: event.phone,
        birthday: event.birthday,
        level: event.level,
      ),
    );

    result.fold(
      (l) => emit(
        ProfileLoadErrorState(
          exception: l,
        ),
      ),
      (r) => add(
        const ProfileInitEvent(),
      ),
    );
  }
}
