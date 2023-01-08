import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/theme/colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../schedule/domain/entities/schedule_entity.dart';
import '../../../schedule/presentation/blocs/schedule_bloc/schedule_bloc.dart';
import '../../../schedule/presentation/blocs/schedule_bloc/schedule_event.dart';
import '../../../schedule/presentation/blocs/schedule_bloc/schedule_state.dart';
import '../widgets/history_item.dart';

class HistoryContent extends StatefulWidget {
  const HistoryContent({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final ScheduleBloc bloc;

  @override
  State<HistoryContent> createState() => _HistoryContentState();
}

class _HistoryContentState extends State<HistoryContent> {
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
        body: BlocBuilder<ScheduleBloc, ScheduleState>(
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
