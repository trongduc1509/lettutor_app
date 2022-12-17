import 'package:dartz/dartz.dart';
import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';
import 'package:lettutor_app/feature/courses/detail/domain/entities/course_detail_entity.dart';

abstract class CourseDetailRepository {
  Future<Either<AppException, CourseDetailResponseEntity>> getCourseDetail(
      String courseId);
}
