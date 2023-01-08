import 'package:flutter_bloc/flutter_bloc.dart';

part 'tutor_schedule_booking_event.dart';
part 'tutor_schedule_booking_state.dart';

class TutorScheduleBookingBloc
    extends Bloc<TutorScheduleBookingEvent, TutorScheduleBookingState> {
  TutorScheduleBookingBloc() : super(const TutorScheduleBookingInitState());
}
