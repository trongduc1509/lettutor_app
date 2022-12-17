import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/courses/detail/presentation/blocs/course_detail_bloc/course_detail_bloc.dart';
import 'package:lettutor_app/feature/courses/detail/presentation/views/course_detail_content.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({
    Key? key,
    required this.courseId,
  }) : super(key: key);

  final String courseId;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            CourseDetailBloc()..add(CourseDetailLoadEvent(courseId: courseId)),
        child: const CourseDetailContent(),
      );
}
