import 'package:dartz/dartz.dart';

import '../../../../base/define/apigateway/exception/app_exception.dart';
import '../entities/cancel_booking_entity.dart';

abstract class CancelBookingRepository {
  Future<Either<AppException, CancelBookingEntity>> cancelBookedClass(
      Map<String, dynamic> params);
}
