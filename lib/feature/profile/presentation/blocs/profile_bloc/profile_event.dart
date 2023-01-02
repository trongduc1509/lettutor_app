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

class ProfileUpdateEvent extends ProfileEvent {
  const ProfileUpdateEvent({
    required this.name,
    required this.country,
    required this.phone,
    required this.birthday,
    required this.level,
  });

  final String name;
  final String country;
  final String phone;
  final DateTime birthday;
  final String level;
}
