part of 'profile_bloc.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitState extends ProfileState {
  const ProfileInitState();
}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState();
}

class ProfileLoadDoneState extends ProfileState {
  const ProfileLoadDoneState({
    required this.userInfo,
  });

  final UserInfoEntity userInfo;
}

class ProfileLoadErrorState extends ProfileState {
  const ProfileLoadErrorState({
    required this.exception,
  });

  final AppException exception;
}

class ProfileLogoutState extends ProfileState {
  const ProfileLogoutState();
}
