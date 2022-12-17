import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/history/presentation/views/history_content.dart';
import 'package:lettutor_app/feature/schedule/presentation/blocs/schedule_bloc/schedule_bloc.dart';
import 'package:lettutor_app/feature/schedule/presentation/blocs/schedule_bloc/schedule_event.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<ScheduleBloc>(
        create: (context) => ScheduleBloc()
          ..add(const ScheduleLoadEvent(
            loadType: 2,
          )),
        child: const HistoryContent(),
      );
}
