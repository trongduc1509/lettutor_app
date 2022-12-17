part of 'courses_list_bloc.dart';

abstract class CoursesListEvent {
  const CoursesListEvent();
}

class CoursesListLoadEvent extends CoursesListEvent {
  const CoursesListLoadEvent({
    required this.searchTxt,
    this.page = 1,
    this.size = 100,
  });

  final String searchTxt;
  final int page;
  final int size;
}
