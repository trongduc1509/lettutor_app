class TeacherListUseCaseParams {
  final String studentRequest;
  final int page;
  final int perPage;

  const TeacherListUseCaseParams({
    required this.studentRequest,
    required this.page,
    required this.perPage,
  });
}
