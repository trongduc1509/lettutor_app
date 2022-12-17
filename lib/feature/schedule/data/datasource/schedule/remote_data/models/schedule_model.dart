import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/base/extension/time.dart';

import '../../../../../domain/entities/schedule_entity.dart';

part 'schedule_model.g.dart';

@JsonSerializable()
class ScheduleResponseModel extends SchedulesResponseEntity {
  final String? message;
  final ScheduleResponseDetailModel? data;

  const ScheduleResponseModel({
    this.message,
    this.data,
  });

  static ScheduleResponseModel fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleResponseModelToJson(this);
}

@JsonSerializable()
class ScheduleResponseDetailModel extends SchedulesResponseDetailEntity {
  final int? count;
  final List<ScheduleModel> rows;

  const ScheduleResponseDetailModel({
    this.count,
    this.rows = const [],
  });

  static ScheduleResponseDetailModel fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleResponseDetailModelToJson(this);
}

@JsonSerializable()
class ScheduleModel extends ScheduleEntity {
  final int? createdAtTimeStamp;
  final int? updatedAtTimeStamp;
  final String? id;
  final String? userId;
  final String? scheduleDetailId;
  final String? tutorMeetingLink;
  final String? studentMeetingLink;
  final String? studentRequest;
  final String? tutorReview;
  final int? scoreByTutor;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;
  final String? recordUrl;
  final String? cancelReasonId;
  final String? lessonPlanId;
  final String? cancelNote;
  final String? calendarId;
  final bool? isDeleted;
  final ScheduleDetailInfoModel? scheduleDetailInfo;
  final String? classReview;
  final bool? showRecordUrl;
  //final List<Null> studentMaterials;
  final List<FeedbackModel> feedbacks;

  const ScheduleModel({
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
    this.scheduleDetailInfo,
    this.classReview,
    this.showRecordUrl,
    //this.studentMaterials,
    this.feedbacks = const [],
  });

  static ScheduleModel fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);
}

@JsonSerializable()
class ScheduleDetailInfoModel extends ScheduleDetailInfoEntity {
  final int? startPeriodTimestamp;
  final int? endPeriodTimestamp;
  final String? id;
  final String? scheduleId;
  final String? startPeriod;
  final String? endPeriod;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;
  final ScheduleInfoModel? scheduleInfo;

  const ScheduleDetailInfoModel({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.scheduleInfo,
  });

  static ScheduleDetailInfoModel fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleDetailInfoModelToJson(this);
}

@JsonSerializable()
class ScheduleInfoModel extends ScheduleInfoEntity {
  final DateTime? date;
  final int? startTimestamp;
  final int? endTimestamp;
  final String? id;
  final String? tutorId;
  final String? startTime;
  final String? endTime;
  final bool? isDeleted;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;
  final TutorInfoModel? tutorInfo;

  const ScheduleInfoModel({
    this.date,
    this.startTimestamp,
    this.endTimestamp,
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.tutorInfo,
  });

  static ScheduleInfoModel fromJson(Map<String, dynamic> json) =>
      _$ScheduleInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleInfoModelToJson(this);
}

@JsonSerializable()
class TutorInfoModel extends TutorInfoEntity {
  final String? id;
  final String? level;
  final String? email;
  // Null google;
  // Null facebook;
  // Null apple;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  final String? birthday;
  final bool? requestPassword;
  final bool? isActivated;
  final bool? isPhoneActivated;
  final String? requireNote;
  final int? timezone;
  //final Null phoneAuth;
  final bool? isPhoneAuthActivated;
  //final String? studySchedule;
  final bool? canSendMessage;
  final bool? isPublicRecord;
  final String? caredByStaffId;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? deletedAt;
  final String? studentGroupId;

  const TutorInfoModel({
    this.id,
    this.level,
    this.email,
    //this.google,
    //this.facebook,
    //this.apple,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    //this.phoneAuth,
    this.isPhoneAuthActivated,
    //this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
  });

  static TutorInfoModel fromJson(Map<String, dynamic> json) =>
      _$TutorInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TutorInfoModelToJson(this);
}

@JsonSerializable()
class FeedbackModel extends FeedbackEntity {
  final String? id;
  final String? bookingId;
  final String? firstId;
  final String? secondId;
  final int? rating;
  final String? content;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;

  const FeedbackModel({
    this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  static FeedbackModel fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackModelToJson(this);
}
