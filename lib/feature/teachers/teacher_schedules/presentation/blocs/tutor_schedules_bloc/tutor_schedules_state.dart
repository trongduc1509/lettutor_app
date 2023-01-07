part of 'tutor_schedules_bloc.dart';

abstract class TutorSchedulesState {
  const TutorSchedulesState();
}

class TutorSchedulesInitState extends TutorSchedulesState {
  const TutorSchedulesInitState();
}

class TutorSchedulesLoadDoneState extends TutorSchedulesState {
  const TutorSchedulesLoadDoneState({
    required this.schedules,
    this.separatedList,
  });

  final List<ScheduleEntity> schedules;
  final Map<String, String>? separatedList;
}

class TutorSchedulesLoadErrorState extends TutorSchedulesState {
  const TutorSchedulesLoadErrorState({
    required this.exception,
  });

  final AppException exception;
}
