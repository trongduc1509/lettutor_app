import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../schedule/presentation/blocs/schedule_bloc/schedule_bloc.dart';
import '../../../schedule/presentation/blocs/schedule_bloc/schedule_event.dart';
import 'history_content.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = ScheduleBloc();
    return BlocProvider<ScheduleBloc>(
      create: (context) => bloc
        ..add(const ScheduleLoadEvent(
          loadType: 2,
        )),
      child: HistoryContent(
        bloc: bloc,
      ),
    );
  }
}
