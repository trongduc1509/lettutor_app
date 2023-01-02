import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/base/extension/time.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/domain/entities/teacher_list_entity.dart';

part 'teacher_list_model.g.dart';

@JsonSerializable()
class TeacherTotalListBaseModel extends TeacherTotalEntity {
  @JsonKey(defaultValue: 0)
  final int? count;
  @JsonKey(defaultValue: [])
  final List<TutorItemBaseModel>? rows;

  const TeacherTotalListBaseModel({
    this.count,
    this.rows,
  });

  static TeacherTotalListBaseModel fromJson(Map<String, dynamic> json) =>
      _$TeacherTotalListBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherTotalListBaseModelToJson(this);
}

@JsonSerializable()
class TutorItemBaseModel extends TutorItemEntity {
  final String? level;
  final String? email;
  // final dynamic google;
  // final dynamic facebook;
  // final dynamic apple;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  final DateTime? birthday;
  final bool? requestPassword;
  final bool? isActivated;
  final dynamic isPhoneActivated;
  final String? requireNote;
  final int? timezone;
  final dynamic phoneAuth;
  final bool? isPhoneAuthActivated;
  final dynamic studySchedule;
  final bool? canSendMessage;
  final bool? isPublicRecord;
  final String? caredByStaffId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? studentGroupId;
  final String? id;
  final String? userId;
  final String? video;
  final String? bio;
  final String? education;
  final String? experience;
  final String? profession;
  // final dynamic accent;
  final String? targetStudent;
  final String? interests;
  final String? languages;
  final String? specialties;
  // final dynamic resume;
  final double? rating;
  final dynamic isNative;
  final String? schedulestimes;
  final String? isfavoritetutor;
  final int? price;

  const TutorItemBaseModel({
    this.level,
    this.email,
    // this.google,
    // this.facebook,
    // this.apple,
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
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
    this.id,
    this.userId,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    // this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    // this.resume,
    this.rating,
    this.isNative,
    this.schedulestimes,
    this.isfavoritetutor,
    this.price,
  });

  static TutorItemBaseModel fromJson(Map<String, dynamic> json) =>
      _$TutorItemBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TutorItemBaseModelToJson(this);
}
