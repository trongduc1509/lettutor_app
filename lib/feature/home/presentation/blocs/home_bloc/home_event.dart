part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeChangeTabEvent extends HomeEvent {
  const HomeChangeTabEvent({
    required this.desTab,
  });

  final int desTab;
}

class HomeUpdateDrawerEvent extends HomeEvent {
  const HomeUpdateDrawerEvent({
    required this.searchTxt,
    required this.tutorType,
    required this.filterSpecialities,
    required this.filterSelectedSpecialities,
    this.availableTime,
  });

  final String searchTxt;
  final String tutorType;
  final List<String> filterSpecialities;
  final List<String> filterSelectedSpecialities;
  final DateTime? availableTime;
}
