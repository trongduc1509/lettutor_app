import 'package:dartz/dartz.dart';
import 'package:lettutor_app/feature/courses/courses_list/domain/repositories/courses_list_repository.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../base/define/usecase/usecase.base.dart';
import '../../entities/courses_list_entity.dart';
import 'courses_list_params.usecase.dart';

class CoursesListUseCase
    with
        UseCase<CoursesListUseCaseParams,
            Either<AppException, CoursesListResponseEntity>> {
  const CoursesListUseCase(this._coursesRepo);

  final CoursesListRepository _coursesRepo;

  @override
  Future<Either<AppException, CoursesListResponseEntity>> execute(
          CoursesListUseCaseParams params) =>
      _coursesRepo.getCoursesList(
        {
          'page': params.page,
          'size': params.size,
        },
        {
          'studentRequest': params.studentRequest,
        },
      );
}
