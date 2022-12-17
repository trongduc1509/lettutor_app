import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/courses_list_bloc/courses_list_bloc.dart';
import 'courses_list_content.dart';

class CoursesListPage extends StatelessWidget {
  const CoursesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => CoursesListBloc(),
        child: const CoursesListContent(),
      );
}
