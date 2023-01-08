import 'package:equatable/equatable.dart';

import '../../../../../base/define/enum.dart';
import '../../../../../base/extension/time.dart';

class SchedulesTotalEntity extends Equatable {
  final String? message;
  final List<ScheduleEntity>? data;

  const SchedulesTotalEntity({
    this.message = '',
    this.data = const [],
  });

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class ScheduleEntity extends Equatable {
  final String? id;
  final String? tutorId;
  final String? startTime;
  final String? endTime;
  final int? startTimestamp;
  final int? endTimestamp;
  final DateTime? createdAt;
  final bool? isBooked;
  final List<ScheduleDetailEntity>? scheduleDetails;

  const ScheduleEntity({
    this.id = '',
    this.tutorId = '',
    this.startTime = '',
    this.endTime = '',
    this.startTimestamp,
    this.endTimestamp,
    this.createdAt,
    this.isBooked = false,
    this.scheduleDetails = const [],
  });

  String getDaysOfWeek() => numberToDate(
      DateTime.fromMillisecondsSinceEpoch(startTimestamp ?? 0).weekday);

  String getDate() => DateTime.fromMillisecondsSinceEpoch(startTimestamp ?? 0)
      .convertDate('dd/MM/yyyy');

  String getAvailableTimeId() =>
      (scheduleDetails ?? [])
          .firstWhere((element) => element.isBooked == false)
          .id ??
      '';

  @override
  List<Object?> get props => [
        id,
        tutorId,
        startTime,
        endTime,
        startTimestamp,
        endTimestamp,
        createdAt,
        isBooked,
        scheduleDetails,
      ];
}

class ScheduleDetailEntity extends Equatable {
  final int? startPeriodTimestamp;
  final int? endPeriodTimestamp;
  final String? id;
  final String? scheduleId;
  final String? startPeriod;
  final String? endPeriod;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ScheduleDetailBookingInfoEntity>? bookingInfo;
  final bool? isBooked;

  const ScheduleDetailEntity({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.bookingInfo = const [],
    this.isBooked = false,
  });

  @override
  List<Object?> get props => [
        startPeriodTimestamp,
        endPeriodTimestamp,
        id,
        scheduleId,
        startPeriod,
        endPeriod,
        createdAt,
        updatedAt,
        bookingInfo,
        isBooked,
      ];
}

class ScheduleDetailBookingInfoEntity extends Equatable {
  final int? createdAtTimeStamp;
  final int? updatedAtTimeStamp;
  final String? id;
  final String? userId;
  final String? scheduleDetailId;
  final String? tutorMeetingLink;
  final String? studentMeetingLink;
  final String? studentRequest;
  final String? tutorReview;
  final double? scoreByTutor;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? recordUrl;
  final int? cancelReasonId;
  final int? lessonPlanId;
  final String? cancelNote;
  final String? calendarId;
  final bool? isDeleted;

  const ScheduleDetailBookingInfoEntity({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.userId,
    this.scheduleDetailId,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    this.createdAt,
    this.updatedAt,
    this.recordUrl,
    this.cancelReasonId,
    this.lessonPlanId,
    this.cancelNote,
    this.calendarId,
    this.isDeleted,
  });

  @override
  List<Object?> get props => [
        createdAtTimeStamp,
        updatedAtTimeStamp,
        id,
        userId,
        scheduleDetailId,
        tutorMeetingLink,
        studentMeetingLink,
        studentRequest,
        tutorReview,
        scoreByTutor,
        createdAt,
        updatedAt,
        recordUrl,
        cancelReasonId,
        lessonPlanId,
        cancelNote,
        calendarId,
        isDeleted,
      ];
}
