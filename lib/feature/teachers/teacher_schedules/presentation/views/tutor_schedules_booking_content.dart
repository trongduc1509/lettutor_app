import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/style/default_style.dart';
import '../blocs/tutor_schedules_bloc/tutor_schedules_bloc.dart';
import '../widgets/tutor_schedule_item.dart';

class TutorSchedulesBookingContent extends StatelessWidget {
  const TutorSchedulesBookingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Schedules & Booking',
                  style: DefaultStyle().t14Medium,
                ),
              ],
            ),
            const Divider(
              height: 1.0,
              thickness: 1.0,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: BlocListener<TutorSchedulesBloc, TutorSchedulesState>(
                listener: (context, state) {
                  if (state is TutorSchedulesLoadErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.exception.displayMessage,
                        ),
                      ),
                    );
                  }
                },
                child: BlocBuilder<TutorSchedulesBloc, TutorSchedulesState>(
                  builder: (context, state) {
                    if (state is TutorSchedulesLoadDoneState) {
                      return state.schedules.isEmpty
                          ? Center(
                              child: Text(
                                'No available schedule for this tutor...',
                                style: DefaultStyle().t16Medium,
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var newList =
                                    state.separatedList?.values.toList() ?? [];
                                if (newList
                                    .contains(state.schedules[index].id)) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${state.schedules[index].getDaysOfWeek()}, ${state.schedules[index].getDate()}',
                                        style: DefaultStyle().t14Bold,
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      TutorScheduleItem(
                                        scheduleEntity: state.schedules[index],
                                      ),
                                    ],
                                  );
                                }
                                return TutorScheduleItem(
                                  scheduleEntity: state.schedules[index],
                                );
                              },
                              itemCount: state.schedules.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 5.0,
                              ),
                            );
                    }
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
