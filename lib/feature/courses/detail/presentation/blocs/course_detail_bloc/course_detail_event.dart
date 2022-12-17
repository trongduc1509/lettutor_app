part of 'course_detail_bloc.dart';

abstract class CourseDetailEvent {
  const CourseDetailEvent();
}

class CourseDetailLoadEvent extends CourseDetailEvent {
  const CourseDetailLoadEvent({
    required this.courseId,
  });

  final String courseId;
}
