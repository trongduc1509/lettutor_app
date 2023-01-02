class TeacherListSearchUseCaseParams {
  const TeacherListSearchUseCaseParams({
    required this.isVietnamese,
    required this.searchTxt,
    required this.perPage,
  });

  final bool isVietnamese;
  final String searchTxt;
  final int perPage;
}
