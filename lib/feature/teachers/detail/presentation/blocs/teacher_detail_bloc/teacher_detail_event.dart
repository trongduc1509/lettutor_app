part of 'teacher_detail_bloc.dart';

abstract class TeacherDetailEvent {
  const TeacherDetailEvent();
}

class TeacherDetailLoadEvent extends TeacherDetailEvent {
  const TeacherDetailLoadEvent({
    required this.teacherId,
  });

  final String teacherId;
}

class TeacherUpdateFavEvent extends TeacherDetailEvent {
  const TeacherUpdateFavEvent({
    required this.teacherId,
  });

  final String teacherId;
}
