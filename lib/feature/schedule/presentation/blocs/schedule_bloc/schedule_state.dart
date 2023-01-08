import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';
import 'package:lettutor_app/feature/schedule/domain/entities/schedule_entity.dart';

abstract class ScheduleState {
  const ScheduleState();
}

class ScheduleInitState extends ScheduleState {
  const ScheduleInitState();
}

class ScheduleLoadingState extends ScheduleState {
  const ScheduleLoadingState();
}

class ScheduleLoadDoneState extends ScheduleState {
  const ScheduleLoadDoneState({
    required this.scheduleRes,
    required this.loadType,
    required this.perPage,
  });

  final SchedulesResponseEntity scheduleRes;
  final int loadType;
  final int perPage;
}

class ScheduleLoadErrorState extends ScheduleState {
  const ScheduleLoadErrorState({
    required this.exception,
    required this.loadType,
    required this.perPage,
  });

  final AppException exception;
  final int loadType;
  final int perPage;
}
