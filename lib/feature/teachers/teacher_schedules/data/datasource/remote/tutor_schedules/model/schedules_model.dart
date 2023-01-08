import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/schedules_entity.dart';

part 'schedules_model.g.dart';

@JsonSerializable(createToJson: false)
class SchedulesTotalModel extends SchedulesTotalEntity {
  final String? message;
  final List<ScheduleModel>? data;

  const SchedulesTotalModel({
    this.message = '',
    this.data = const [],
  });

  static SchedulesTotalModel fromJson(Map<String, dynamic> json) =>
      _$SchedulesTotalModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ScheduleModel extends ScheduleEntity {
  final String? id;
  final String? tutorId;
  final String? startTime;
  final String? endTime;
  final int? startTimestamp;
  final int? endTimestamp;
  final DateTime? createdAt;
  final bool? isBooked;
  final List<ScheduleDetailModel>? scheduleDetails;

  const ScheduleModel({
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

  static ScheduleModel fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ScheduleDetailModel extends ScheduleDetailEntity {
  final int? startPeriodTimestamp;
  final int? endPeriodTimestamp;
  final String? id;
  final String? scheduleId;
  final String? startPeriod;
  final String? endPeriod;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ScheduleDetailBookingInfoModel>? bookingInfo;
  final bool? isBooked;

  const ScheduleDetailModel({
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

  static ScheduleDetailModel fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ScheduleDetailBookingInfoModel extends ScheduleDetailBookingInfoEntity {
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

  const ScheduleDetailBookingInfoModel({
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

  static ScheduleDetailBookingInfoModel fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailBookingInfoModelFromJson(json);
}
