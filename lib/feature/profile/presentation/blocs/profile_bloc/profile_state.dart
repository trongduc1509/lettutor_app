part of 'profile_bloc.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitState extends ProfileState {
  const ProfileInitState();
}

class ProfileLogoutState extends ProfileState {
  const ProfileLogoutState();
}
