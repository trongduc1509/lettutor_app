// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherDetailBaseModel _$TeacherDetailBaseModelFromJson(
        Map<String, dynamic> json) =>
    TeacherDetailBaseModel(
      video: json['video'] as String?,
      bio: json['bio'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      profession: json['profession'] as String?,
      accent: json['accent'] as String?,
      targetStudent: json['targetStudent'] as String?,
      interests: json['interests'] as String?,
      languages: json['languages'] as String?,
      specialties: json['specialties'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      isNative: json['isNative'] as bool?,
      user: json['User'] == null
          ? null
          : TeacherDetailUserBaseModel.fromJson(
              json['User'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool?,
      avgRating: (json['avgRating'] as num?)?.toDouble(),
      totalFeedback: json['totalFeedback'] as int?,
    );

Map<String, dynamic> _$TeacherDetailBaseModelToJson(
        TeacherDetailBaseModel instance) =>
    <String, dynamic>{
      'video': instance.video,
      'bio': instance.bio,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'accent': instance.accent,
      'targetStudent': instance.targetStudent,
      'interests': instance.interests,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'rating': instance.rating,
      'isNative': instance.isNative,
      'User': instance.user,
      'isFavorite': instance.isFavorite,
      'avgRating': instance.avgRating,
      'totalFeedback': instance.totalFeedback,
    };

TeacherDetailUserBaseModel _$TeacherDetailUserBaseModelFromJson(
        Map<String, dynamic> json) =>
    TeacherDetailUserBaseModel(
      json['id'] as String?,
      json['level'] as String?,
      json['avatar'] as String?,
      json['name'] as String?,
      json['country'] as String?,
      json['language'] as String?,
      json['isPublicRecord'] as bool?,
      json['caredByStaffId'] as String?,
      json['studentGroupId'] as String?,
      (json['courses'] as List<dynamic>?)
              ?.map((e) => TeacherDetailUserCourseBaseModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TeacherDetailUserBaseModelToJson(
        TeacherDetailUserBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'language': instance.language,
      'isPublicRecord': instance.isPublicRecord,
      'caredByStaffId': instance.caredByStaffId,
      'studentGroupId': instance.studentGroupId,
      'courses': instance.courses,
    };

TeacherDetailUserCourseBaseModel _$TeacherDetailUserCourseBaseModelFromJson(
        Map<String, dynamic> json) =>
    TeacherDetailUserCourseBaseModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      tutorCourse: json['TutorCourse'] == null
          ? null
          : TeacherDetailUserCourseTutorCourseBaseModel.fromJson(
              json['TutorCourse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeacherDetailUserCourseBaseModelToJson(
        TeacherDetailUserCourseBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'TutorCourse': instance.tutorCourse,
    };

TeacherDetailUserCourseTutorCourseBaseModel
    _$TeacherDetailUserCourseTutorCourseBaseModelFromJson(
            Map<String, dynamic> json) =>
        TeacherDetailUserCourseTutorCourseBaseModel(
          userId: json['UserId'] as String?,
          courseId: json['CourseId'] as String?,
          createdAt: jsonToTime(json['createdAt'] as String?),
          updatedAt: jsonToTime(json['updatedAt'] as String?),
        );

Map<String, dynamic> _$TeacherDetailUserCourseTutorCourseBaseModelToJson(
        TeacherDetailUserCourseTutorCourseBaseModel instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'CourseId': instance.courseId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
