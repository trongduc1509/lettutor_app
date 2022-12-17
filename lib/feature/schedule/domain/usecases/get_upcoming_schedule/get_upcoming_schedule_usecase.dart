import 'package:dartz/dartz.dart';
import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';
import 'package:lettutor_app/base/define/usecase/usecase.base.dart';
import 'package:lettutor_app/feature/schedule/domain/entities/schedule_entity.dart';
import 'package:lettutor_app/feature/schedule/domain/usecases/get_upcoming_schedule/get_upcoming_schedule_usecase_params.dart';

import '../../repositories/schedule_repository.dart';

class GetUpcomingScheduleUseCase
    with
        UseCase<GetUpcomingScheduleUseCaseParams,
            Either<AppException, SchedulesResponseEntity>> {
  const GetUpcomingScheduleUseCase(this._repo);

  final ScheduleRepository _repo;

  @override
  Future<Either<AppException, SchedulesResponseEntity>> execute(
          GetUpcomingScheduleUseCaseParams params) =>
      _repo.getUpcomingClass(params.toJson());
}
