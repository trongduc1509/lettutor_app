import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/teachers_bloc/teachers_bloc.dart';
import 'teachers_content.dart';

class TeachersPage extends StatelessWidget {
  const TeachersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teacherBloc = TeachersBloc();
    return BlocProvider<TeachersBloc>(
      create: (context) => teacherBloc
        ..add(
          const TeacherLoadEvent(
            searchTxt: '',
          ),
        ),
      child: TeachersContent(
        bloc: teacherBloc,
      ),
    );
  }
}
