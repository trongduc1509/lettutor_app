import 'package:dartz/dartz.dart';
import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../entities/teacher_detail_entity.dart';

abstract class TeacherDetailRepository {
  Future<Either<AppException, TeacherDetailEntity>> getDetailTutor(
      String tutorId);
}
