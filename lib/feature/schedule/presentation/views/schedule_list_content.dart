import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/schedule/domain/entities/schedule_entity.dart';
import 'package:lettutor_app/feature/schedule/presentation/blocs/schedule_bloc/schedule_bloc.dart';
import 'package:lettutor_app/feature/schedule/presentation/blocs/schedule_bloc/schedule_event.dart';

import '../../../../base/theme/colors.dart';
import '../../../../base/util/notifier.dart';
import '../../../../gen/assets.gen.dart';
import '../blocs/schedule_bloc/schedule_state.dart';
import '../widgets/schedule_item.dart';

class ScheduleListContent extends StatefulWidget {
  const ScheduleListContent({Key? key}) : super(key: key);

  @override
  State<ScheduleListContent> createState() => _ScheduleListContentState();
}

class _ScheduleListContentState extends State<ScheduleListContent> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<ScheduleBloc, ScheduleState>(
          builder: (context, state) {
            if (state is ScheduleLoadDoneState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.images.calendar.path,
                        width: MediaQuery.of(context).size.width * 1 / 4,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Schedule',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColor().tertiary,
                            ),
                            child: const SizedBox(
                              width: 2.0,
                              height: 30.0,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Expanded(
                            child: Text(
                              "Here is a list of the sessions you have booked\nYou can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1, color: AppColor().greyBorder),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: IconButton(
                                  icon: SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Image.asset(
                                      Assets.images.filter.path,
                                      alignment: Alignment.center,
                                      //fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  onPressed: () {
                                    Notifier.showCheckBottomSheet(
                                      context,
                                      title: 'Country',
                                      ratioHeight: 0.5,
                                      listData: ['Upcoming', 'Booked'],
                                      selectedIndex: state.loadType,
                                      onSelected: (index) {
                                        context.read<ScheduleBloc>().add(
                                            ScheduleLoadEvent(loadType: index));
                                      },
                                    );
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.scheduleRes.data?.rows.length ?? 0,
                        itemBuilder: (context, index) => ScheduleItem(
                            item: state.scheduleRes.data?.rows[index] ??
                                const ScheduleEntity()),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ScheduleLoadingState) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            return const Center(
              child: Text('Error while getting schedules data...'),
            );
          },
        ),
      );
}
