import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tutor_schedule_booking_bloc.dart/tutor_schedule_booking_bloc.dart';
import '../blocs/tutor_schedules_bloc/tutor_schedules_bloc.dart';
import 'tutor_schedules_booking_content.dart';

class TutorSchedulesBookingPage extends StatelessWidget {
  const TutorSchedulesBookingPage({
    Key? key,
    required this.tutorId,
  }) : super(key: key);

  final String tutorId;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<TutorSchedulesBloc>(
            create: (context) => TutorSchedulesBloc()
              ..add(
                TutorSchedulesLoadEvent(
                  tutorId: tutorId,
                ),
              ),
          ),
          BlocProvider<TutorScheduleBookingBloc>(
            create: (context) => TutorScheduleBookingBloc(),
          ),
        ],
        child: TutorSchedulesBookingContent(
          tutorId: tutorId,
        ),
      );
}
