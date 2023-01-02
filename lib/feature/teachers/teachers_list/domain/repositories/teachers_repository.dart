import 'package:dartz/dartz.dart';
import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../entities/teacher_list_entity.dart';
import '../entities/teacher_list_get_entity.dart';

abstract class TeacherListRepository {
  Future<Either<AppException, TeacherTotalGetEntity>> getTeacherList(
      Map<String, dynamic> params, Map<String, dynamic> body);

  Future<Either<AppException, TeacherTotalEntity>> searchTeacherList(
      Map<String, dynamic> params);

  Future<Either<AppException, dynamic>> manageFavTeacher(
      Map<String, dynamic> params);
}
