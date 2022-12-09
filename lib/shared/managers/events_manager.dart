import 'package:rxdart/rxdart.dart';

class EventsManager {
  factory EventsManager() => _instance;

  EventsManager._internal();

  static final EventsManager _instance = EventsManager._internal();

  final sessionExpired = BehaviorSubject<DateTime>();
}
