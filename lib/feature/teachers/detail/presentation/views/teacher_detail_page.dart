import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../teachers_list/domain/entities/teacher_list_entity.dart';
import '../blocs/teacher_detail_bloc/teacher_detail_bloc.dart';
import 'teacher_detail_content.dart';

class TeacherDetailPage extends StatelessWidget {
  const TeacherDetailPage({
    Key? key,
    this.dataFromList,
  }) : super(key: key);

  final TutorItemEntity? dataFromList;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => TeacherDetailBloc()
          ..add(TeacherDetailLoadEvent(
            teacherId: dataFromList?.userId ?? '',
          )),
        child: const TeacherDetailContent(),
      );
}
