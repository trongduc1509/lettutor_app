import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/schedule/domain/entities/schedule_entity.dart';

import '../../../../base/theme/colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../schedule/presentation/blocs/schedule_bloc/schedule_bloc.dart';
import '../../../schedule/presentation/blocs/schedule_bloc/schedule_state.dart';
import '../widgets/history_item.dart';

class HistoryContent extends StatefulWidget {
  const HistoryContent({Key? key}) : super(key: key);

  @override
  State<HistoryContent> createState() => _HistoryContentState();
}

class _HistoryContentState extends State<HistoryContent> {
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
                        Assets.images.history.path,
                        width: MediaQuery.of(context).size.width * 1 / 4,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'History',
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
                              "The following is a list of lessons you have attended\nYou can review the details of the lessons you have attended",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15.0,
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
                        itemBuilder: (context, index) => HistoryItem(
                          item: state.scheduleRes.data?.rows[index] ??
                              const ScheduleEntity(),
                        ),
                      )
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
