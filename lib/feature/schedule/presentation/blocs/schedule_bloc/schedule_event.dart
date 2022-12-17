abstract class ScheduleEvent {
  const ScheduleEvent();
}

class ScheduleLoadEvent extends ScheduleEvent {
  const ScheduleLoadEvent({
    required this.loadType,
  });

  final int loadType;
}
