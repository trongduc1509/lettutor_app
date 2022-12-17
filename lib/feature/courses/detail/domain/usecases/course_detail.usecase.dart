import 'package:dartz/dartz.dart';
import 'package:lettutor_app/feature/courses/detail/domain/repositories/course_detail_repository.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../base/define/usecase/usecase.base.dart';
import '../entities/course_detail_entity.dart';

class CourseDetailUseCase
    with UseCase<String, Either<AppException, CourseDetailResponseEntity>> {
  const CourseDetailUseCase(this._repo);

  final CourseDetailRepository _repo;

  @override
  Future<Either<AppException, CourseDetailResponseEntity>> execute(
          String params) =>
      _repo.getCourseDetail(params);
}
