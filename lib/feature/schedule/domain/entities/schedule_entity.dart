class SchedulesResponseEntity {
  final String? message;
  final SchedulesResponseDetailEntity? data;

  const SchedulesResponseEntity({
    this.message,
    this.data,
  });
}

class SchedulesResponseDetailEntity {
  final int? count;
  final List<ScheduleEntity> rows;

  const SchedulesResponseDetailEntity({
    this.count,
    this.rows = const [],
  });
}

class ScheduleEntity {
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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? recordUrl;
  final String? cancelReasonId;
  final String? lessonPlanId;
  final String? cancelNote;
  final String? calendarId;
  final bool? isDeleted;
  final ScheduleDetailInfoEntity? scheduleDetailInfo;
  final String? classReview;
  final bool? showRecordUrl;
  //final List<Null> studentMaterials;
  final List<FeedbackEntity> feedbacks;

  const ScheduleEntity({
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
}

class ScheduleDetailInfoEntity {
  final int? startPeriodTimestamp;
  final int? endPeriodTimestamp;
  final String? id;
  final String? scheduleId;
  final String? startPeriod;
  final String? endPeriod;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ScheduleInfoEntity? scheduleInfo;

  const ScheduleDetailInfoEntity({
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
}

class ScheduleInfoEntity {
  final DateTime? date;
  final int? startTimestamp;
  final int? endTimestamp;
  final String? id;
  final String? tutorId;
  final String? startTime;
  final String? endTime;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final TutorInfoEntity? tutorInfo;

  const ScheduleInfoEntity({
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
}

class TutorInfoEntity {
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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? studentGroupId;

  const TutorInfoEntity({
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
}

class FeedbackEntity {
  final String? id;
  final String? bookingId;
  final String? firstId;
  final String? secondId;
  final int? rating;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const FeedbackEntity({
    this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
  });
}
