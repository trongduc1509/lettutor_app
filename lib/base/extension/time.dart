import 'package:intl/intl.dart';

DateTime? jsonToTime(String? timeString) {
  if (timeString == null) return null;
  var time = DateTime.parse(timeString);
  return time;
  // return time.toLocal();
}

String? timeToJson(DateTime? date) {
  if (date == null) return null;
  var time = date.toIso8601String();
  return time;
  // return time.toLocal();
}

DateTime get startDay => DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 00, 00, 00)
        .subtract(const Duration(
      days: 30,
    ));

DateTime get endDay => DateTime(
    DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59, 59);

extension DateTimeParse on DateTime {
  String convertDate(String dateFormat) {
    final docDateTime = DateTime.parse(toString());
    return DateFormat(dateFormat).format(docDateTime);
  }
}
