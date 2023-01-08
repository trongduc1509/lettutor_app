import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/style/default_style.dart';
import '../../../../../base/extension/time.dart';
import '../../domain/entities/schedules_entity.dart';
import '../blocs/tutor_schedule_booking_bloc.dart/tutor_schedule_booking_bloc.dart';

class TutorScheduleItem extends StatelessWidget {
  const TutorScheduleItem({
    Key? key,
    required this.scheduleEntity,
  }) : super(key: key);

  final ScheduleEntity scheduleEntity;

  @override
  Widget build(BuildContext context) => Container(
        // constraints: const BoxConstraints(
        //   minHeight: 30.0,
        //   maxHeight: 30.0,
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${DateTime.fromMillisecondsSinceEpoch(scheduleEntity.startTimestamp ?? 0).convertDate('HH:mm')} - ${DateTime.fromMillisecondsSinceEpoch(scheduleEntity.endTimestamp ?? 0).convertDate('HH:mm')}',
              style: DefaultStyle().t14Medium.copyWith(
                    color: Colors.white,
                  ),
            ),
            if (scheduleEntity.isBooked == false)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.read<TutorScheduleBookingBloc>().add(
                        TutorScheduleBookEvent(
                          scheduleDetailId: scheduleEntity.getAvailableTimeId(),
                        ),
                      );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Book',
                      style: DefaultStyle().t14Medium.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14.0,
                      color: Colors.white,
                    )
                  ],
                ),
              )
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color:
              scheduleEntity.isBooked == false ? Colors.blue : Colors.grey[600],
        ),
      );
}
