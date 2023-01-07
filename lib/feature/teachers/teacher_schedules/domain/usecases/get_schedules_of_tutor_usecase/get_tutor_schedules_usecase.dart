import 'package:dartz/dartz.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../base/define/usecase/usecase.base.dart';
import '../../entities/schedules_entity.dart';
import '../../repositories/teacher_schedules_repository.dart';
import 'get_tutor_schedules_usecase_params.dart';

class GetTutorSchedulesUseCase
    with
        UseCase<GetTutorSchedulesUseCaseParams,
            Either<AppException, SchedulesTotalEntity>> {
  const GetTutorSchedulesUseCase({
    required this.teacherSchedulesRepository,
  });

  final TeacherSchedulesRepository teacherSchedulesRepository;

  @override
  Future<Either<AppException, SchedulesTotalEntity>> execute(
          GetTutorSchedulesUseCaseParams params) =>
      teacherSchedulesRepository.getSchedulesByTutorId(params.toJson());
}
