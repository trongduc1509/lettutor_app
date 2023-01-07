import 'package:dartz/dartz.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../entities/schedules_entity.dart';

abstract class TeacherSchedulesRepository {
  Future<Either<AppException, SchedulesTotalEntity>> getSchedulesByTutorId(
      Map<String, dynamic> params);
}
