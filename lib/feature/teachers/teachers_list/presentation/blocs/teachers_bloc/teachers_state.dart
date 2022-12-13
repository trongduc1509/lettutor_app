part of 'teachers_bloc.dart';

abstract class TeachersState {
  const TeachersState();
}

class TeachersInitState extends TeachersState {
  const TeachersInitState();
}

class TeachersLoadingState extends TeachersState {
  const TeachersLoadingState();
}

class TeachersLoadDoneState extends TeachersState {
  const TeachersLoadDoneState({
    required this.tutorsList,
    this.searchTxt = '',
    this.perPage = 10,
    this.page = 1,
  });

  final TeacherTotalEntity tutorsList;
  final String searchTxt;
  final int perPage;
  final int page;
}

class TeachersLoadErrorState extends TeachersState {
  const TeachersLoadErrorState({
    required this.exception,
  });

  final AppException exception;
}
