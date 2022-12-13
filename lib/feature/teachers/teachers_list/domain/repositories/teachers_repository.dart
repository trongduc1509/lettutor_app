import 'package:dartz/dartz.dart';
import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../entities/teacher_list_entity.dart';

abstract class TeacherListRepository {
  Future<Either<AppException, TeacherTotalEntity>> getTeacherList(
      Map<String, dynamic> params, Map<String, dynamic> body);
}
