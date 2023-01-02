import 'package:dartz/dartz.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../base/define/usecase/usecase.base.dart';
import '../../entities/teacher_list_entity.dart';
import '../../repositories/teachers_repository.dart';
import 'teacher_list_search_params.usecase.dart';

class TeacherListSearchUseCase
    with
        UseCase<TeacherListSearchUseCaseParams,
            Either<AppException, TeacherTotalEntity>> {
  const TeacherListSearchUseCase(this._teacherListRepository);

  final TeacherListRepository _teacherListRepository;

  @override
  Future<Either<AppException, TeacherTotalEntity>> execute(
          TeacherListSearchUseCaseParams params) =>
      _teacherListRepository.searchTeacherList({
        "filters": {
          "specialties": [],
          "date": null,
          "nationality": {"isVietnamese": params.isVietnamese},
          "tutoringTimeAvailable": [null, null]
        },
        "search": params.searchTxt,
        "page": "1",
        "perPage": params.perPage,
      });
}
