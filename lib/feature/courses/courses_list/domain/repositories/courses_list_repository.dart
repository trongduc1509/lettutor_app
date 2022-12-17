import 'package:dartz/dartz.dart';
import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';
import 'package:lettutor_app/feature/courses/courses_list/domain/entities/courses_list_entity.dart';

abstract class CoursesListRepository {
  Future<Either<AppException, CoursesListResponseEntity>> getCoursesList(
      Map<String, dynamic> param, Map<String, dynamic> body);
}
