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
    required this.tutorsReviewsList,
    required this.tutorsList,
    this.searchTxt = '',
    this.perPage = 10,
    this.page = 1,
    this.isVietnamese = false,
    this.showLoading = false,
  });

  final TeacherTotalGetEntity tutorsReviewsList;
  final TeacherTotalEntity tutorsList;
  final String searchTxt;
  final int perPage;
  final int page;
  final bool isVietnamese;
  final bool showLoading;
}

class TeachersLoadErrorState extends TeachersState {
  const TeachersLoadErrorState({
    required this.exception,
    this.searchTxt = '',
    this.perPage = 10,
    this.page = 1,
    this.isVietnamese = false,
  });

  final AppException exception;
  final String searchTxt;
  final int perPage;
  final int page;
  final bool isVietnamese;
}
