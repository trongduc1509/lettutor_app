part of 'teachers_bloc.dart';

abstract class TeachersEvent {
  const TeachersEvent();
}

class TeacherLoadEvent extends TeachersEvent {
  const TeacherLoadEvent({
    this.isVietnamese = false,
    required this.searchTxt,
    this.perPage = 10,
    this.page = 1,
  });

  final bool isVietnamese;
  final String searchTxt;
  final int perPage;
  final int page;
}

class TeacherFavUpdateEvent extends TeachersEvent {
  const TeacherFavUpdateEvent({
    this.isVietnamese = false,
    required this.searchTxt,
    this.perPage = 10,
    this.page = 1,
    required this.tutorId,
  });

  final bool isVietnamese;
  final String searchTxt;
  final int perPage;
  final int page;
  final String tutorId;
}
