class CoursesListUseCaseParams {
  final String studentRequest;
  final int page;
  final int size;

  const CoursesListUseCaseParams({
    required this.studentRequest,
    required this.page,
    required this.size,
  });
}
