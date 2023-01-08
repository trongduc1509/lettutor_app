import 'package:dartz/dartz.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../base/define/usecase/usecase.base.dart';
import '../../entities/cancel_booking_entity.dart';
import '../../repositories/cancel_booking_repository.dart';
import 'cancel_booked_class_usecase_params.dart';

class CancelBookingUseCase
    with
        UseCase<CancelBookingUseCaseParams,
            Either<AppException, CancelBookingEntity>> {
  const CancelBookingUseCase({
    required this.cancelBookingRepo,
  });

  final CancelBookingRepository cancelBookingRepo;

  @override
  Future<Either<AppException, CancelBookingEntity>> execute(
          CancelBookingUseCaseParams params) =>
      cancelBookingRepo.cancelBookedClass(params.toJson());
}
