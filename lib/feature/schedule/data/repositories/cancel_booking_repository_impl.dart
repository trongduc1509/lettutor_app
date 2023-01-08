import 'package:dartz/dartz.dart';

import '../../../../di/di_module.dart';
import '../../domain/entities/cancel_booking_entity.dart';
import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../../domain/repositories/cancel_booking_repository.dart';
import '../datasource/cancel_booking/remote_data/cancel_booking_remote_datasource.dart';

class CancelBookingRepositoryImpl extends CancelBookingRepository {
  CancelBookingRepositoryImpl();

  final CancelBookingRemoteDatasource _cancelBookingRemoteDs =
      getIt.get<CancelBookingRemoteDatasource>();

  @override
  Future<Either<AppException, CancelBookingEntity>> cancelBookedClass(
      Map<String, dynamic> params) async {
    try {
      final result = await _cancelBookingRemoteDs.cancelBookedClass(params);
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
