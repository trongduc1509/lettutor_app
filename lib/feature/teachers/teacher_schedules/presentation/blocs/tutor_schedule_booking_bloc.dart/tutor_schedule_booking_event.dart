part of 'tutor_schedule_booking_bloc.dart';

abstract class TutorScheduleBookingEvent {
  const TutorScheduleBookingEvent();
}

class TutorScheduleBookEvent extends TutorScheduleBookingEvent {
  const TutorScheduleBookEvent({
    required this.scheduleDetailId,
  });

  final String scheduleDetailId;
}
