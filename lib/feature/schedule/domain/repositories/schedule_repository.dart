import 'package:dartz/dartz.dart';
import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../entities/schedule_entity.dart';

abstract class ScheduleRepository {
  Future<Either<AppException, SchedulesResponseEntity>> getBookedOrStudiedClass(
      Map<String, dynamic> params);

  Future<Either<AppException, SchedulesResponseEntity>> getUpcomingClass(
      Map<String, dynamic> params);
}
