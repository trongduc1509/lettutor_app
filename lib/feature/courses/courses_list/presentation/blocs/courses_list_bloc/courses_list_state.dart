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
    this.size = 10,
    this.page = 1,
    this.showLoading = false,
  });

  final CoursesListResponseEntity coursesList;
  final String searchTxt;
  final int page;
  final int size;
  final bool showLoading;
}

class CoursesListLoadErrorState extends CoursesListState {
  const CoursesListLoadErrorState({
    required this.exception,
    this.searchTxt = '',
    this.size = 10,
    this.page = 1,
  });

  final AppException exception;
  final String searchTxt;
  final int page;
  final int size;
}
