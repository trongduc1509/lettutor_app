import 'package:dartz/dartz.dart';

import '../../../../../di/di_module.dart';
import '../../domain/entities/schedules_entity.dart';
import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../domain/repositories/teacher_schedules_repository.dart';
import '../datasource/remote/tutor_schedules/schedules_remote_datasource.dart';

class TeacherSchedulesRepositoryImpl extends TeacherSchedulesRepository {
  TeacherSchedulesRepositoryImpl();

  final SchedulesRemoteDatasource schedulesRemoteDatasource =
      getIt.get<SchedulesRemoteDatasource>();

  @override
  Future<Either<AppException, SchedulesTotalEntity>> getSchedulesByTutorId(
      Map<String, dynamic> params) async {
    try {
      final result =
          await schedulesRemoteDatasource.getSchedulesByTutorId(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(
        AppException(
          error: e,
        ),
      );
    }
  }
}
