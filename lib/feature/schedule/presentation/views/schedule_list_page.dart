import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/schedule/presentation/blocs/schedule_bloc/schedule_bloc.dart';
import 'package:lettutor_app/feature/schedule/presentation/blocs/schedule_bloc/schedule_event.dart';
import 'package:lettutor_app/feature/schedule/presentation/views/schedule_list_content.dart';

class ScheduleListPage extends StatelessWidget {
  const ScheduleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ScheduleBloc()
          ..add(const ScheduleLoadEvent(
            loadType: 0,
          )),
        child: const ScheduleListContent(),
      );
}
