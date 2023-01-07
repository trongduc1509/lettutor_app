import 'package:flutter/material.dart';

import '../../../../../base/define/style/default_style.dart';
import '../../domain/entities/schedules_entity.dart';

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
              '${scheduleEntity.startTime} - ${scheduleEntity.endTime}',
              style: DefaultStyle().t14Medium.copyWith(
                    color: Colors.white,
                  ),
            ),
            if (scheduleEntity.isBooked == false)
              GestureDetector(
                onTap: () {},
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
          borderRadius: BorderRadius.circular(10.0),
          color:
              scheduleEntity.isBooked == false ? Colors.blue : Colors.grey[600],
        ),
      );
}
