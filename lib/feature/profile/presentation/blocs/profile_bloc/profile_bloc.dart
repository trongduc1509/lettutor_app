import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';
import 'package:lettutor_app/feature/authentication/domain/repositories/authentication_repository.dart';
import 'package:lettutor_app/feature/profile/domain/entities/user_info_entity.dart';
import 'package:lettutor_app/feature/profile/domain/repositories/profile_repository.dart';
import 'package:lettutor_app/feature/profile/domain/usecases/get_user_info_usecase/get_user_info_usecase.dart';
import 'package:lettutor_app/feature/profile/domain/usecases/logout_usecase/logout_usecase.dart';
import 'package:lettutor_app/shared/managers/app_manager.dart';
import 'package:lettutor_app/shared/managers/events_manager.dart';

import '../../../../../di/di_module.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileInitState()) {
    on<ProfileInitEvent>(_onInit);
    on<ProfileLogoutEvent>(_onLogout);
    add(const ProfileInitEvent());
  }

  final GetUserInfoUseCase _getUserInfoUseCase = GetUserInfoUseCase(
    profileRepo: getIt.get<ProfileRepository>(),
  );
  final LogoutUseCase _logoutUseCase = LogoutUseCase(
    authRepo: getIt.get<AuthenticationRepository>(),
  );

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
}
