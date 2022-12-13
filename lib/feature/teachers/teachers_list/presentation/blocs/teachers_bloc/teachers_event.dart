part of 'teachers_bloc.dart';

abstract class TeachersEvent {
  const TeachersEvent();
}

class TeacherLoadEvent extends TeachersEvent {
  const TeacherLoadEvent({
    required this.searchTxt,
    this.perPage = 10,
    this.page = 1,
  });

  final String searchTxt;
  final int perPage;
  final int page;
}
