import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';
import 'package:lettutor_app/feature/schedule/domain/entities/schedule_entity.dart';
import 'package:lettutor_app/feature/schedule/domain/usecases/get_booked_studied_schedule/get_booked_studied_schedule_usecase_params.dart';
import 'package:lettutor_app/feature/schedule/domain/usecases/get_upcoming_schedule/get_upcoming_schedule_usecase.dart';
import 'package:lettutor_app/feature/schedule/domain/usecases/get_upcoming_schedule/get_upcoming_schedule_usecase_params.dart';

import '../../../../../di/di_module.dart';
import '../../../domain/repositories/schedule_repository.dart';
import '../../../domain/usecases/get_booked_studied_schedule/get_booked_studied_schedule_usecase.dart';
import 'schedule_event.dart';
import 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(const ScheduleInitState()) {
    on<ScheduleLoadEvent>(_onLoad);
  }

  final GetBookedStudiedScheduleUseCase _bookedStudiedUseCase =
      GetBookedStudiedScheduleUseCase(getIt.get<ScheduleRepository>());
  final GetUpcomingScheduleUseCase _upcomingUseCase =
      GetUpcomingScheduleUseCase(getIt.get<ScheduleRepository>());

  void _onLoad(ScheduleLoadEvent event, emit) async {
    emit(const ScheduleLoadingState());
    int dataTimeLte;
    Either<AppException, SchedulesResponseEntity> result;
    switch (event.loadType) {
      case 0: //UPCOMING
        dataTimeLte = DateTime.now().millisecond;
        result = await _upcomingUseCase(
            GetUpcomingScheduleUseCaseParams(dateTimeGte: dataTimeLte));
        break;
      case 1: //BOOKED
        dataTimeLte =
            DateTime.now().subtract(const Duration(minutes: 5)).millisecond;
        result = await _bookedStudiedUseCase(
            GetBookedStudiedScheduleUseCaseParams(dateTimeLte: dataTimeLte));
        break;
      case 2: //STUDIED
        dataTimeLte =
            DateTime.now().subtract(const Duration(minutes: 35)).millisecond;
        result = await _bookedStudiedUseCase(
            GetBookedStudiedScheduleUseCaseParams(dateTimeLte: dataTimeLte));
        break;
      default:
        dataTimeLte =
            DateTime.now().subtract(const Duration(minutes: 5)).millisecond;
        result = await _bookedStudiedUseCase(
            GetBookedStudiedScheduleUseCaseParams(dateTimeLte: dataTimeLte));
    }

    result.fold(
      (l) => emit(
        ScheduleLoadErrorState(exception: l),
      ),
      (r) => emit(
        ScheduleLoadDoneState(
          scheduleRes: r,
          loadType: event.loadType,
        ),
      ),
    );
  }
}
