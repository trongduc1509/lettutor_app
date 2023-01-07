// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleResponseModel _$ScheduleResponseModelFromJson(
        Map<String, dynamic> json) =>
    ScheduleResponseModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ScheduleResponseDetailModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleResponseModelToJson(
        ScheduleResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

ScheduleResponseDetailModel _$ScheduleResponseDetailModelFromJson(
        Map<String, dynamic> json) =>
    ScheduleResponseDetailModel(
      count: json['count'] as int?,
      rows: (json['rows'] as List<dynamic>?)
              ?.map((e) => ScheduleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ScheduleResponseDetailModelToJson(
        ScheduleResponseDetailModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel(
      createdAtTimeStamp: json['createdAtTimeStamp'] as int?,
      updatedAtTimeStamp: json['updatedAtTimeStamp'] as int?,
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      scheduleDetailId: json['scheduleDetailId'] as String?,
      tutorMeetingLink: json['tutorMeetingLink'] as String?,
      studentMeetingLink: json['studentMeetingLink'] as String?,
      studentRequest: json['studentRequest'] as String?,
      tutorReview: json['tutorReview'] as String?,
      scoreByTutor: json['scoreByTutor'] as int?,
      createdAt: jsonToTime(json['createdAt'] as String?),
      updatedAt: jsonToTime(json['updatedAt'] as String?),
      recordUrl: json['recordUrl'] as String?,
      cancelReasonId: json['cancelReasonId'] as String?,
      lessonPlanId: json['lessonPlanId'] as String?,
      cancelNote: json['cancelNote'] as String?,
      calendarId: json['calendarId'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      scheduleDetailInfo: json['scheduleDetailInfo'] == null
          ? null
          : ScheduleDetailInfoModel.fromJson(
              json['scheduleDetailInfo'] as Map<String, dynamic>),
      classReview: json['classReview'] == null
          ? null
          : ClassReviewModel.fromJson(
              json['classReview'] as Map<String, dynamic>),
      showRecordUrl: json['showRecordUrl'] as bool?,
      feedbacks: (json['feedbacks'] as List<dynamic>?)
              ?.map((e) => FeedbackModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ScheduleModelToJson(ScheduleModel instance) =>
    <String, dynamic>{
      'createdAtTimeStamp': instance.createdAtTimeStamp,
      'updatedAtTimeStamp': instance.updatedAtTimeStamp,
      'id': instance.id,
      'userId': instance.userId,
      'scheduleDetailId': instance.scheduleDetailId,
      'tutorMeetingLink': instance.tutorMeetingLink,
      'studentMeetingLink': instance.studentMeetingLink,
      'studentRequest': instance.studentRequest,
      'tutorReview': instance.tutorReview,
      'scoreByTutor': instance.scoreByTutor,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'recordUrl': instance.recordUrl,
      'cancelReasonId': instance.cancelReasonId,
      'lessonPlanId': instance.lessonPlanId,
      'cancelNote': instance.cancelNote,
      'calendarId': instance.calendarId,
      'isDeleted': instance.isDeleted,
      'scheduleDetailInfo': instance.scheduleDetailInfo,
      'classReview': instance.classReview,
      'showRecordUrl': instance.showRecordUrl,
      'feedbacks': instance.feedbacks,
    };

ScheduleDetailInfoModel _$ScheduleDetailInfoModelFromJson(
        Map<String, dynamic> json) =>
    ScheduleDetailInfoModel(
      startPeriodTimestamp: json['startPeriodTimestamp'] as int?,
      endPeriodTimestamp: json['endPeriodTimestamp'] as int?,
      id: json['id'] as String?,
      scheduleId: json['scheduleId'] as String?,
      startPeriod: json['startPeriod'] as String?,
      endPeriod: json['endPeriod'] as String?,
      createdAt: jsonToTime(json['createdAt'] as String?),
      updatedAt: jsonToTime(json['updatedAt'] as String?),
      scheduleInfo: json['scheduleInfo'] == null
          ? null
          : ScheduleInfoModel.fromJson(
              json['scheduleInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleDetailInfoModelToJson(
        ScheduleDetailInfoModel instance) =>
    <String, dynamic>{
      'startPeriodTimestamp': instance.startPeriodTimestamp,
      'endPeriodTimestamp': instance.endPeriodTimestamp,
      'id': instance.id,
      'scheduleId': instance.scheduleId,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'scheduleInfo': instance.scheduleInfo,
    };

ScheduleInfoModel _$ScheduleInfoModelFromJson(Map<String, dynamic> json) =>
    ScheduleInfoModel(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      startTimestamp: json['startTimestamp'] as int?,
      endTimestamp: json['endTimestamp'] as int?,
      id: json['id'] as String?,
      tutorId: json['tutorId'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: jsonToTime(json['createdAt'] as String?),
      updatedAt: jsonToTime(json['updatedAt'] as String?),
      tutorInfo: json['tutorInfo'] == null
          ? null
          : TutorInfoModel.fromJson(json['tutorInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleInfoModelToJson(ScheduleInfoModel instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'id': instance.id,
      'tutorId': instance.tutorId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'tutorInfo': instance.tutorInfo,
    };

TutorInfoModel _$TutorInfoModelFromJson(Map<String, dynamic> json) =>
    TutorInfoModel(
      id: json['id'] as String?,
      level: json['level'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      language: json['language'] as String?,
      birthday: json['birthday'] as String?,
      requestPassword: json['requestPassword'] as bool?,
      isActivated: json['isActivated'] as bool?,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      requireNote: json['requireNote'] as String?,
      timezone: json['timezone'] as int?,
      isPhoneAuthActivated: json['isPhoneAuthActivated'] as bool?,
      canSendMessage: json['canSendMessage'] as bool?,
      isPublicRecord: json['isPublicRecord'] as bool?,
      caredByStaffId: json['caredByStaffId'] as String?,
      createdAt: jsonToTime(json['createdAt'] as String?),
      updatedAt: jsonToTime(json['updatedAt'] as String?),
      deletedAt: jsonToTime(json['deletedAt'] as String?),
      studentGroupId: json['studentGroupId'] as String?,
    );

Map<String, dynamic> _$TutorInfoModelToJson(TutorInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'email': instance.email,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'phone': instance.phone,
      'language': instance.language,
      'birthday': instance.birthday,
      'requestPassword': instance.requestPassword,
      'isActivated': instance.isActivated,
      'isPhoneActivated': instance.isPhoneActivated,
      'requireNote': instance.requireNote,
      'timezone': instance.timezone,
      'isPhoneAuthActivated': instance.isPhoneAuthActivated,
      'canSendMessage': instance.canSendMessage,
      'isPublicRecord': instance.isPublicRecord,
      'caredByStaffId': instance.caredByStaffId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'studentGroupId': instance.studentGroupId,
    };

FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) =>
    FeedbackModel(
      id: json['id'] as String?,
      bookingId: json['bookingId'] as String?,
      firstId: json['firstId'] as String?,
      secondId: json['secondId'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      content: json['content'] as String?,
      createdAt: jsonToTime(json['createdAt'] as String?),
      updatedAt: jsonToTime(json['updatedAt'] as String?),
    );

Map<String, dynamic> _$FeedbackModelToJson(FeedbackModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'firstId': instance.firstId,
      'secondId': instance.secondId,
      'rating': instance.rating,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

ClassReviewModel _$ClassReviewModelFromJson(Map<String, dynamic> json) =>
    ClassReviewModel(
      bookingId: json['bookingId'] as String?,
      lessonStatusId: json['lessonStatusId'] as int?,
      book: json['book'] as String?,
      unit: json['unit'] as String?,
      lesson: json['lesson'] as String?,
      page: json['page'],
      lessonProgress: json['lessonProgress'] as String?,
      behaviorRating: json['behaviorRating'] as int?,
      behaviorComment: json['behaviorComment'] as String?,
      listeningRating: json['listeningRating'] as int?,
      listeningComment: json['listeningComment'] as String?,
      speakingRating: json['speakingRating'] as int?,
      speakingComment: json['speakingComment'] as String?,
      vocabularyRating: json['vocabularyRating'] as int?,
      vocabularyComment: json['vocabularyComment'] as String?,
      homeworkComment: json['homeworkComment'] as String?,
      overallComment: json['overallComment'] as String?,
      lessonStatus: json['lessonStatus'] == null
          ? null
          : LessonStatusModel.fromJson(
              json['lessonStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClassReviewModelToJson(ClassReviewModel instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'lessonStatusId': instance.lessonStatusId,
      'book': instance.book,
      'unit': instance.unit,
      'lesson': instance.lesson,
      'page': instance.page,
      'lessonProgress': instance.lessonProgress,
      'behaviorRating': instance.behaviorRating,
      'behaviorComment': instance.behaviorComment,
      'listeningRating': instance.listeningRating,
      'listeningComment': instance.listeningComment,
      'speakingRating': instance.speakingRating,
      'speakingComment': instance.speakingComment,
      'vocabularyRating': instance.vocabularyRating,
      'vocabularyComment': instance.vocabularyComment,
      'homeworkComment': instance.homeworkComment,
      'overallComment': instance.overallComment,
      'lessonStatus': instance.lessonStatus,
    };

LessonStatusModel _$LessonStatusModelFromJson(Map<String, dynamic> json) =>
    LessonStatusModel(
      id: json['id'] as int?,
      status: json['status'] as String?,
      createdAt: jsonToTime(json['createdAt'] as String?),
      updatedAt: jsonToTime(json['updatedAt'] as String?),
    );

Map<String, dynamic> _$LessonStatusModelToJson(LessonStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
