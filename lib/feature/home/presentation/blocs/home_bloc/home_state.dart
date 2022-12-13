part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitState extends HomeState {
  const HomeInitState();
}

class HomeChangedTabState extends HomeState {
  const HomeChangedTabState({
    required this.currentTab,
  });

  final int currentTab;
}

class HomeUpdateEndDrawerState extends HomeState {
  const HomeUpdateEndDrawerState({
    this.searchTxt = '',
    this.tutorType = 'Foreign Tutor',
    this.availableTime,
    this.filterSpecialities = const [],
    this.filterSelectedSpecialities = const [],
  });

  final String searchTxt;
  final String tutorType;
  final List<String> filterSpecialities;
  final List<String> filterSelectedSpecialities;
  final DateTime? availableTime;
}
