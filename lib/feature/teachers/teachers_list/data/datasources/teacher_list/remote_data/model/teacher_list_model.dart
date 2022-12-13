import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/base/extension/time.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/domain/entities/teacher_list_entity.dart';

part 'teacher_list_model.g.dart';

@JsonSerializable()
class TeacherTotalListBaseModel extends TeacherTotalEntity {
  final TutorsListBaseModel? tutors;
  @JsonKey(defaultValue: [])
  final List<TutorFavBaseModel>? favoriteTutor;

  const TeacherTotalListBaseModel({
    this.tutors,
    this.favoriteTutor,
  });

  static TeacherTotalListBaseModel fromJson(Map<String, dynamic> json) =>
      _$TeacherTotalListBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherTotalListBaseModelToJson(this);
}

@JsonSerializable()
class TutorsListBaseModel extends TutorsListEntity {
  final int? count;
  final List<TutorItemBaseModel>? rows;

  const TutorsListBaseModel({
    this.count,
    this.rows,
  });

  static TutorsListBaseModel fromJson(Map<String, dynamic> json) =>
      _$TutorsListBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TutorsListBaseModelToJson(this);
}

@JsonSerializable()
class TutorItemBaseModel extends TutorItemEntity {
  final String? level;
  final String? email;
  // final Null? google;
  // final Null? facebook;
  // final Null? apple;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? birthday;
  final bool? requestPassword;
  final bool? isActivated;
  final bool? isPhoneActivated;
  final String? requireNote;
  final int? timezone;
  //final Null? phoneAuth;
  final bool? isPhoneAuthActivated;
  //final Null? studySchedule;
  final bool? canSendMessage;
  final bool? isPublicRecord;
  //final Null? caredByStaffId;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? deletedAt;
  final String? studentGroupId;
  final List<TutorItemFeedbackBaseModel>? feedbacks;
  final String? id;
  final String? userId;
  final String? video;
  final String? bio;
  final String? education;
  final String? experience;
  final String? profession;
  //final Null? accent;
  final String? targetStudent;
  final String? interests;
  final String? languages;
  final String? specialties;
  //final Null? resume;
  final double? rating;
  final bool? isNative;
  final int? price;
  final bool? isOnline;

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
    //this.phoneAuth,
    this.isPhoneAuthActivated,
    //this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    //this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
    this.feedbacks,
    this.id,
    this.userId,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    //this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    //this.resume,
    this.rating,
    this.isNative,
    this.price,
    this.isOnline,
  });

  static TutorItemBaseModel fromJson(Map<String, dynamic> json) =>
      _$TutorItemBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TutorItemBaseModelToJson(this);
}

@JsonSerializable()
class TutorItemFeedbackBaseModel extends TutorItemFeedbackEntity {
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
  final TutorItemFeedbackFirstInfoBaseModel? firstInfo;

  const TutorItemFeedbackBaseModel({
    this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.firstInfo,
  });

  static TutorItemFeedbackBaseModel fromJson(Map<String, dynamic> json) =>
      _$TutorItemFeedbackBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TutorItemFeedbackBaseModelToJson(this);
}

@JsonSerializable()
class TutorItemFeedbackFirstInfoBaseModel
    extends TutorItemFeedbackFirstInfoEntity {
  final String? level;
  final String? email;
  // final Null? google;
  // final Null? facebook;
  // final Null? apple;
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
  //final Null? phoneAuth;
  final bool? isPhoneAuthActivated;
  final String? studySchedule;
  final bool? canSendMessage;
  final bool? isPublicRecord;
  //final Null? caredByStaffId;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? deletedAt;
  final String? studentGroupId;

  const TutorItemFeedbackFirstInfoBaseModel({
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
    //this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    //this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
  });

  static TutorItemFeedbackFirstInfoBaseModel fromJson(
          Map<String, dynamic> json) =>
      _$TutorItemFeedbackFirstInfoBaseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TutorItemFeedbackFirstInfoBaseModelToJson(this);
}

@JsonSerializable()
class TutorFavBaseModel extends TutorFavEntity {
  final String? id;
  final String? firstId;
  final String? secondId;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;
  final TeacherFavoriteSecInfoModel? secondInfo;

  const TutorFavBaseModel({
    this.id,
    this.firstId,
    this.secondId,
    this.createdAt,
    this.updatedAt,
    this.secondInfo,
  });

  static TutorFavBaseModel fromJson(Map<String, dynamic> json) =>
      _$TutorFavBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TutorFavBaseModelToJson(this);
}

@JsonSerializable()
class TeacherFavoriteSecInfoModel extends TutorFavSecInfoEntity {
  final String? id;
  final String? level;
  final String? email;
  //final Null? google;
  //final Null? facebook;
  //final Null? apple;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? birthday;
  final bool? requestPassword;
  final bool? isActivated;
  final bool? isPhoneActivated;
  final String? requireNote;
  final int? timezone;
  //final Null? phoneAuth;
  final bool? isPhoneAuthActivated;
  //final Null? studySchedule;
  final bool? canSendMessage;
  final bool? isPublicRecord;
  //final Null? caredByStaffId;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? deletedAt;
  final String? studentGroupId;
  final TeacherFavoriteTutorInfoModel? tutorInfo;

  const TeacherFavoriteSecInfoModel({
    this.id,
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
    //this.phoneAuth,
    this.isPhoneAuthActivated,
    //this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    //this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
    this.tutorInfo,
  });

  static TeacherFavoriteSecInfoModel fromJson(Map<String, dynamic> json) =>
      _$TeacherFavoriteSecInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherFavoriteSecInfoModelToJson(this);
}

@JsonSerializable()
class TeacherFavoriteTutorInfoModel extends TutorFavTutorInfoEntity {
  final String? id;
  final String? userId;
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
  //final Null? resume;
  final double? rating;
  final bool? isActivated;
  final bool? isNative;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;

  const TeacherFavoriteTutorInfoModel({
    this.id,
    this.userId,
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
    //this.resume,
    this.rating,
    this.isActivated,
    this.isNative,
    this.createdAt,
    this.updatedAt,
  });

  static TeacherFavoriteTutorInfoModel fromJson(Map<String, dynamic> json) =>
      _$TeacherFavoriteTutorInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherFavoriteTutorInfoModelToJson(this);
}
