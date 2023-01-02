// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_list_get_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherTotalListGetBaseModel _$TeacherTotalListGetBaseModelFromJson(
        Map<String, dynamic> json) =>
    TeacherTotalListGetBaseModel(
      tutors: json['tutors'] == null
          ? null
          : TutorsListGetBaseModel.fromJson(
              json['tutors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeacherTotalListGetBaseModelToJson(
        TeacherTotalListGetBaseModel instance) =>
    <String, dynamic>{
      'tutors': instance.tutors,
    };

TutorsListGetBaseModel _$TutorsListGetBaseModelFromJson(
        Map<String, dynamic> json) =>
    TutorsListGetBaseModel(
      count: json['count'] as int?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map(
              (e) => TutorItemGetBaseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorsListGetBaseModelToJson(
        TutorsListGetBaseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };

TutorItemGetBaseModel _$TutorItemGetBaseModelFromJson(
        Map<String, dynamic> json) =>
    TutorItemGetBaseModel(
      level: json['level'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      language: json['language'] as String?,
      birthday: jsonToTime(json['birthday'] as String?),
      requestPassword: json['requestPassword'] as bool?,
      isActivated: json['isActivated'] as bool?,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      requireNote: json['requireNote'] as String?,
      timezone: json['timezone'] as int?,
      isPhoneAuthActivated: json['isPhoneAuthActivated'] as bool?,
      canSendMessage: json['canSendMessage'] as bool?,
      isPublicRecord: json['isPublicRecord'] as bool?,
      createdAt: jsonToTime(json['createdAt'] as String?),
      updatedAt: jsonToTime(json['updatedAt'] as String?),
      deletedAt: jsonToTime(json['deletedAt'] as String?),
      studentGroupId: json['studentGroupId'] as String?,
      feedbacks: (json['feedbacks'] as List<dynamic>?)
          ?.map((e) =>
              TutorItemFeedbackBaseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      video: json['video'] as String?,
      bio: json['bio'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      profession: json['profession'] as String?,
      targetStudent: json['targetStudent'] as String?,
      interests: json['interests'] as String?,
      languages: json['languages'] as String?,
      specialties: json['specialties'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      isNative: json['isNative'] as bool?,
      price: json['price'] as int?,
      isOnline: json['isOnline'] as bool?,
    );

Map<String, dynamic> _$TutorItemGetBaseModelToJson(
        TutorItemGetBaseModel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'email': instance.email,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'phone': instance.phone,
      'language': instance.language,
      'birthday': instance.birthday?.toIso8601String(),
      'requestPassword': instance.requestPassword,
      'isActivated': instance.isActivated,
      'isPhoneActivated': instance.isPhoneActivated,
      'requireNote': instance.requireNote,
      'timezone': instance.timezone,
      'isPhoneAuthActivated': instance.isPhoneAuthActivated,
      'canSendMessage': instance.canSendMessage,
      'isPublicRecord': instance.isPublicRecord,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'studentGroupId': instance.studentGroupId,
      'feedbacks': instance.feedbacks,
      'id': instance.id,
      'userId': instance.userId,
      'video': instance.video,
      'bio': instance.bio,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'targetStudent': instance.targetStudent,
      'interests': instance.interests,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'rating': instance.rating,
      'isNative': instance.isNative,
      'price': instance.price,
      'isOnline': instance.isOnline,
    };

TutorItemFeedbackBaseModel _$TutorItemFeedbackBaseModelFromJson(
        Map<String, dynamic> json) =>
    TutorItemFeedbackBaseModel(
      id: json['id'] as String?,
      bookingId: json['bookingId'] as String?,
      firstId: json['firstId'] as String?,
      secondId: json['secondId'] as String?,
      rating: json['rating'] as int?,
      content: json['content'] as String?,
      createdAt: jsonToTime(json['createdAt'] as String?),
      updatedAt: jsonToTime(json['updatedAt'] as String?),
      firstInfo: json['firstInfo'] == null
          ? null
          : TutorItemFeedbackFirstInfoBaseModel.fromJson(
              json['firstInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TutorItemFeedbackBaseModelToJson(
        TutorItemFeedbackBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'firstId': instance.firstId,
      'secondId': instance.secondId,
      'rating': instance.rating,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'firstInfo': instance.firstInfo,
    };

TutorItemFeedbackFirstInfoBaseModel
    _$TutorItemFeedbackFirstInfoBaseModelFromJson(Map<String, dynamic> json) =>
        TutorItemFeedbackFirstInfoBaseModel(
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
          studySchedule: json['studySchedule'] as String?,
          canSendMessage: json['canSendMessage'] as bool?,
          isPublicRecord: json['isPublicRecord'] as bool?,
          createdAt: jsonToTime(json['createdAt'] as String?),
          updatedAt: jsonToTime(json['updatedAt'] as String?),
          deletedAt: jsonToTime(json['deletedAt'] as String?),
          studentGroupId: json['studentGroupId'] as String?,
        );

Map<String, dynamic> _$TutorItemFeedbackFirstInfoBaseModelToJson(
        TutorItemFeedbackFirstInfoBaseModel instance) =>
    <String, dynamic>{
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
      'studySchedule': instance.studySchedule,
      'canSendMessage': instance.canSendMessage,
      'isPublicRecord': instance.isPublicRecord,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'studentGroupId': instance.studentGroupId,
    };
