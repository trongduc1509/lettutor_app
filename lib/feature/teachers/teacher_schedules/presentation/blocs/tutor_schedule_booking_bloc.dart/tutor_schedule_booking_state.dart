part of 'tutor_schedule_booking_bloc.dart';

abstract class TutorScheduleBookingState {
  const TutorScheduleBookingState();
}

class TutorScheduleBookingInitState extends TutorScheduleBookingState {
  const TutorScheduleBookingInitState();
}

class TutorScheduleBookingDoneState extends TutorScheduleBookingState {
  const TutorScheduleBookingDoneState();
}

class TutorScheduleBookingErrorState extends TutorScheduleBookingState {
  const TutorScheduleBookingErrorState({
    required this.exception,
  });

  final AppException exception;
}
