// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchedulesTotalModel _$SchedulesTotalModelFromJson(Map<String, dynamic> json) =>
    SchedulesTotalModel(
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ScheduleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel(
      id: json['id'] as String? ?? '',
      tutorId: json['tutorId'] as String? ?? '',
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      startTimestamp: json['startTimestamp'] as int?,
      endTimestamp: json['endTimestamp'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isBooked: json['isBooked'] as bool? ?? false,
      scheduleDetails: (json['scheduleDetails'] as List<dynamic>?)
              ?.map((e) =>
                  ScheduleDetailModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

ScheduleDetailModel _$ScheduleDetailModelFromJson(Map<String, dynamic> json) =>
    ScheduleDetailModel(
      startPeriodTimestamp: json['startPeriodTimestamp'] as int?,
      endPeriodTimestamp: json['endPeriodTimestamp'] as int?,
      id: json['id'] as String?,
      scheduleId: json['scheduleId'] as String?,
      startPeriod: json['startPeriod'] as String?,
      endPeriod: json['endPeriod'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      bookingInfo: (json['bookingInfo'] as List<dynamic>?)
              ?.map((e) => ScheduleDetailBookingInfoModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      isBooked: json['isBooked'] as bool? ?? false,
    );

ScheduleDetailBookingInfoModel _$ScheduleDetailBookingInfoModelFromJson(
        Map<String, dynamic> json) =>
    ScheduleDetailBookingInfoModel(
      createdAtTimeStamp: json['createdAtTimeStamp'] as int?,
      updatedAtTimeStamp: json['updatedAtTimeStamp'] as int?,
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      scheduleDetailId: json['scheduleDetailId'] as String?,
      tutorMeetingLink: json['tutorMeetingLink'] as String?,
      studentMeetingLink: json['studentMeetingLink'] as String?,
      studentRequest: json['studentRequest'] as String?,
      tutorReview: json['tutorReview'] as String?,
      scoreByTutor: (json['scoreByTutor'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      recordUrl: json['recordUrl'] as String?,
      cancelReasonId: json['cancelReasonId'] as int?,
      lessonPlanId: json['lessonPlanId'] as int?,
      cancelNote: json['cancelNote'] as String?,
      calendarId: json['calendarId'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );
