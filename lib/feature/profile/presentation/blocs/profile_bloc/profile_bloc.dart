import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/authentication/domain/repositories/authentication_repository.dart';
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
  }

  final LogoutUseCase _logoutUseCase = LogoutUseCase(
    authRepo: getIt.get<AuthenticationRepository>(),
  );

  void _onInit(ProfileInitEvent event, emit) {}

  void _onLogout(ProfileLogoutEvent event, emit) async {
    await _logoutUseCase.execute(null);
    AppManager.shared.appState.add(AppState.unauthenticated);
    EventsManager().sessionExpired.add(DateTime.now());

    emit(const ProfileLogoutState());
  }
}
