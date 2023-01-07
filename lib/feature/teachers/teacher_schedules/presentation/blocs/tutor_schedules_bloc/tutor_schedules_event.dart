part of 'tutor_schedules_bloc.dart';

abstract class TutorSchedulesEvent {
  const TutorSchedulesEvent();
}

class TutorSchedulesLoadEvent extends TutorSchedulesEvent {
  const TutorSchedulesLoadEvent({
    required this.tutorId,
  });

  final String tutorId;
}
