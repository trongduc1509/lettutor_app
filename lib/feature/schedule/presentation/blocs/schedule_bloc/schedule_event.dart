abstract class ScheduleEvent {
  const ScheduleEvent();
}

class ScheduleLoadEvent extends ScheduleEvent {
  const ScheduleLoadEvent({
    required this.loadType,
    this.perPage = 6,
  });

  final int loadType;
  final int perPage;
}

class ScheduleCancelEvent extends ScheduleEvent {
  const ScheduleCancelEvent({
    required this.scheduleId,
    required this.loadType,
    this.perPage = 6,
  });

  final String scheduleId;
  final int loadType;
  final int perPage;
}
