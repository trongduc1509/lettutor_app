import 'package:dartz/dartz.dart';
import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../entities/courses_list_entity.dart';

abstract class CoursesListRepository {
  Future<Either<AppException, CoursesListResponseEntity>> getCoursesList(
      Map<String, dynamic> param);
}
