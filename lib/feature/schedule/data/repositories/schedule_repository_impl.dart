import 'package:dartz/dartz.dart';

import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../di/di_module.dart';
import '../../domain/entities/schedule_entity.dart';
import '../../domain/repositories/schedule_repository.dart';
import '../datasource/schedule/remote_data/schedule_remote_datasource.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  ScheduleRepositoryImpl();

  final ScheduleRemoteDatasource scheduleRemoteDatasource =
      getIt.get<ScheduleRemoteDatasource>();

  @override
  Future<Either<AppException, SchedulesResponseEntity>> getBookedOrStudiedClass(
      Map<String, dynamic> params) async {
    try {
      var result = await scheduleRemoteDatasource.getBookedClasses(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(AppException(
        error: e,
      ));
    }
  }

  @override
  Future<Either<AppException, SchedulesResponseEntity>> getUpcomingClass(
      Map<String, dynamic> params) async {
    try {
      var result = await scheduleRemoteDatasource.getBookedClasses(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(AppException(
        error: e,
      ));
    }
  }
}
