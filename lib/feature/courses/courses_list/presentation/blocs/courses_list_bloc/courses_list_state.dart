part of 'courses_list_bloc.dart';

abstract class CoursesListState {
  const CoursesListState();
}

class CoursesListInitState extends CoursesListState {
  const CoursesListInitState();
}

class CoursesListLoadingState extends CoursesListState {
  const CoursesListLoadingState();
}

class CoursesListLoadDoneState extends CoursesListState {
  const CoursesListLoadDoneState({
    required this.coursesList,
    this.searchTxt = '',
    this.size = 100,
    this.page = 1,
  });

  final CoursesListResponseEntity coursesList;
  final String searchTxt;
  final int page;
  final int size;
}

class CoursesListLoadErrorState extends CoursesListState {
  const CoursesListLoadErrorState({
    required this.exception,
  });

  final AppException exception;
}
