import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/theme/colors.dart';
import '../../../../base/util/notifier.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/schedule_entity.dart';
import '../blocs/schedule_bloc/schedule_bloc.dart';
import '../blocs/schedule_bloc/schedule_event.dart';
import '../blocs/schedule_bloc/schedule_state.dart';
import '../widgets/schedule_item.dart';

class ScheduleListContent extends StatefulWidget {
  const ScheduleListContent({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final ScheduleBloc bloc;

  @override
  State<ScheduleListContent> createState() => _ScheduleListContentState();
}

class _ScheduleListContentState extends State<ScheduleListContent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        var isTop = _scrollController.position.pixels == 0;
        if (!isTop) {
          var state = widget.bloc.state;
          if (state is ScheduleLoadDoneState) {
            if (state.scheduleRes.data?.rows.isNotEmpty ?? false) {
              if (state.perPage <= (state.scheduleRes.data?.count ?? 0)) {
                widget.bloc.add(
                  ScheduleLoadEvent(
                    perPage: state.perPage + 6,
                    loadType: state.loadType,
                  ),
                );
              }
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocListener<ScheduleBloc, ScheduleState>(
          listener: (context, state) {
            if (state is ScheduleLoadErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.exception.displayMessage,
                  ),
                ),
              );
            }
          },
          child: BlocBuilder<ScheduleBloc, ScheduleState>(
            builder: (context, state) {
              if (state is ScheduleLoadDoneState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    await pullRefresh(state);
                  },
                  child: SingleChildScrollView(
                    controller: _scrollController,
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
                                          width: 1,
                                          color: AppColor().greyBorder),
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
                                                ScheduleLoadEvent(
                                                    loadType: index));
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
                                  const ScheduleEntity(),
                              cancelMeet: () =>
                                  context.read<ScheduleBloc>().add(
                                        ScheduleCancelEvent(
                                          scheduleId: state.scheduleRes.data
                                                  ?.rows[index].id ??
                                              '',
                                          loadType: state.loadType,
                                          perPage: state.perPage,
                                        ),
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Center(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Đang tải dữ liệu.\nVui lòng chờ...',
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CupertinoActivityIndicator(),
                  ],
                ),
              );
            },
          ),
        ),
      );

  Future<void> pullRefresh(ScheduleLoadDoneState state) async {
    widget.bloc.add(
      ScheduleLoadEvent(
        loadType: state.loadType,
      ),
    );
    FocusScope.of(context).unfocus();
  }
}
