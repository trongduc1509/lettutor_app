import 'package:dartz/dartz.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../base/define/usecase/usecase.base.dart';
import '../entities/teacher_detail_entity.dart';
import '../repositories/teacher_detail_repository.dart';

class TeacherDetailUseCase
    with UseCase<String, Either<AppException, TeacherDetailEntity>> {
  const TeacherDetailUseCase(this._teacherDetailRepo);

  final TeacherDetailRepository _teacherDetailRepo;

  @override
  Future<Either<AppException, TeacherDetailEntity>> execute(String params) =>
      _teacherDetailRepo.getDetailTutor(params);
}
