import 'package:dartz/dartz.dart';
import '../../repositories/teachers_repository.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../base/define/usecase/usecase.base.dart';
import 'manage_fav_teacher_params.usecase.dart';

class ManageFavTeacherUseCase
    with UseCase<ManageFavTeacherUseCaseParams, Either<AppException, dynamic>> {
  const ManageFavTeacherUseCase(this._teacherListRepository);

  final TeacherListRepository _teacherListRepository;

  @override
  Future<Either<AppException, dynamic>> execute(
          ManageFavTeacherUseCaseParams params) =>
      _teacherListRepository.manageFavTeacher({
        "tutorId": params.tutorId,
      });
}
