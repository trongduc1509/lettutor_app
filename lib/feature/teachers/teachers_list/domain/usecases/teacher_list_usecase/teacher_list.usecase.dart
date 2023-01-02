import 'package:dartz/dartz.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/domain/repositories/teachers_repository.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../base/define/usecase/usecase.base.dart';
import '../../entities/teacher_list_get_entity.dart';
import 'teacher_list_params.usecase.dart';

class TeacherListUseCase
    with
        UseCase<TeacherListUseCaseParams,
            Either<AppException, TeacherTotalGetEntity>> {
  const TeacherListUseCase(this._teacherListRepository);

  final TeacherListRepository _teacherListRepository;

  @override
  Future<Either<AppException, TeacherTotalGetEntity>> execute(
          TeacherListUseCaseParams params) =>
      _teacherListRepository.getTeacherList(
        {
          'perPage': params.perPage,
          'page': params.page,
        },
        {
          'studentRequest': params.studentRequest,
        },
      );
}
