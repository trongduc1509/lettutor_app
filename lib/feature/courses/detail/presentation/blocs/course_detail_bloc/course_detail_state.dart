part of 'course_detail_bloc.dart';

abstract class CourseDetailState {
  const CourseDetailState();
}

class CourseDetailInitState extends CourseDetailState {
  const CourseDetailInitState();
}

class CourseDetailLoadingState extends CourseDetailState {
  const CourseDetailLoadingState();
}

class CourseDetailLoadDoneState extends CourseDetailState {
  const CourseDetailLoadDoneState({
    required this.data,
  });

  final CourseDetailResponseEntity data;
}

class CourseDetailLoadErrorState extends CourseDetailState {
  const CourseDetailLoadErrorState({
    required this.exception,
  });

  final AppException exception;
}
