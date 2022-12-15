import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../../base/extension/time.dart';
import '../../../../../domain/entities/teacher_detail_entity.dart';

part 'teacher_detail_model.g.dart';

@JsonSerializable()
class TeacherDetailBaseModel extends TeacherDetailEntity {
  final String? video;
  final String? bio;
  final String? education;
  final String? experience;
  final String? profession;
  final String? accent;
  final String? targetStudent;
  final String? interests;
  final String? languages;
  final String? specialties;
  final double? rating;
  final bool? isNative;
  @JsonKey(name: 'User')
  final TeacherDetailUserBaseModel? user;
  final bool? isFavorite;
  final double? avgRating;
  final int? totalFeedback;

  const TeacherDetailBaseModel({
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.rating,
    this.isNative,
    this.user,
    this.isFavorite,
    this.avgRating,
    this.totalFeedback,
  }) : super(
          video: video,
          bio: bio,
          education: education,
          experience: experience,
          profession: profession,
          accent: accent,
          targetStudent: targetStudent,
          interests: interests,
          languages: languages,
          specialties: specialties,
          rating: rating,
          isNative: isNative,
          user: user,
          isFavorite: isFavorite,
          avgRating: avgRating,
          totalFeedback: totalFeedback,
        );

  static TeacherDetailBaseModel fromJson(Map<String, dynamic> json) =>
      _$TeacherDetailBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherDetailBaseModelToJson(this);
}

@JsonSerializable()
class TeacherDetailUserBaseModel extends TeacherDetailUserEntity {
  final String? id;
  final String? level;
  final String? avatar;
  final String? name;
  final String? country;
  final String? language;
  final bool? isPublicRecord;
  final String? caredByStaffId;
  final String? studentGroupId;
  @JsonKey(defaultValue: [])
  final List<TeacherDetailUserCourseBaseModel>? courses;

  @JsonSerializable()
  const TeacherDetailUserBaseModel(
    this.id,
    this.level,
    this.avatar,
    this.name,
    this.country,
    this.language,
    this.isPublicRecord,
    this.caredByStaffId,
    this.studentGroupId,
    this.courses,
  ) : super(
          id: id,
          level: level,
          avatar: avatar,
          name: name,
          country: country,
          language: language,
          isPublicRecord: isPublicRecord,
          caredByStaffId: caredByStaffId,
          studentGroupId: studentGroupId,
          courses: courses,
        );

  static TeacherDetailUserBaseModel fromJson(Map<String, dynamic> json) =>
      _$TeacherDetailUserBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherDetailUserBaseModelToJson(this);
}

@JsonSerializable()
class TeacherDetailUserCourseBaseModel extends TeacherDetailUserCourseEntity {
  final String? id;
  final String? name;
  @JsonKey(name: 'TutorCourse')
  final TeacherDetailUserCourseTutorCourseBaseModel? tutorCourse;

  const TeacherDetailUserCourseBaseModel({
    this.id,
    this.name,
    this.tutorCourse,
  });

  static TeacherDetailUserCourseBaseModel fromJson(Map<String, dynamic> json) =>
      _$TeacherDetailUserCourseBaseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TeacherDetailUserCourseBaseModelToJson(this);
}

@JsonSerializable()
class TeacherDetailUserCourseTutorCourseBaseModel
    extends TeacherDetailUserCourseTutorCourseEntity {
  @JsonKey(name: 'UserId')
  final String? userId;
  @JsonKey(name: 'CourseId')
  final String? courseId;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;

  const TeacherDetailUserCourseTutorCourseBaseModel({
    this.userId,
    this.courseId,
    this.createdAt,
    this.updatedAt,
  }) : super(
          userId: userId,
          courseId: courseId,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static TeacherDetailUserCourseTutorCourseBaseModel fromJson(
          Map<String, dynamic> json) =>
      _$TeacherDetailUserCourseTutorCourseBaseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TeacherDetailUserCourseTutorCourseBaseModelToJson(this);
}
