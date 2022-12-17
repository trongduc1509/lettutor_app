import 'package:dartz/dartz.dart';
import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../base/define/usecase/usecase.base.dart';
import '../../entities/schedule_entity.dart';
import '../../repositories/schedule_repository.dart';
import 'get_booked_studied_schedule_usecase_params.dart';

class GetBookedStudiedScheduleUseCase
    with
        UseCase<GetBookedStudiedScheduleUseCaseParams,
            Either<AppException, SchedulesResponseEntity>> {
  const GetBookedStudiedScheduleUseCase(this._repo);

  final ScheduleRepository _repo;

  @override
  Future<Either<AppException, SchedulesResponseEntity>> execute(
          GetBookedStudiedScheduleUseCaseParams params) =>
      _repo.getBookedOrStudiedClass(params.toJson());
}
