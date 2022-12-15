part of 'teacher_detail_bloc.dart';

abstract class TeacherDetailState {
  const TeacherDetailState();
}

class TeacherDetailInitState extends TeacherDetailState {
  const TeacherDetailInitState();
}

class TeacherDetailLoadingState extends TeacherDetailState {
  const TeacherDetailLoadingState();
}

class TeacherDetailLoadDoneState extends TeacherDetailState {
  const TeacherDetailLoadDoneState({
    required this.data,
  });

  final TeacherDetailEntity data;
}

class TeacherDetailLoadErrorState extends TeacherDetailState {
  const TeacherDetailLoadErrorState({
    required this.exception,
  });

  final AppException exception;
}
