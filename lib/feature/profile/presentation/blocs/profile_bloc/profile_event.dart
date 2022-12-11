part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class ProfileInitEvent extends ProfileEvent {
  const ProfileInitEvent();
}

class ProfileLogoutEvent extends ProfileEvent {
  const ProfileLogoutEvent();
}
