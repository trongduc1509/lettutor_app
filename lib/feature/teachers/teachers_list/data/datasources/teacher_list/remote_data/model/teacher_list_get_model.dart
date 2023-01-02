import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../../base/extension/time.dart';
import '../../../../../domain/entities/teacher_list_get_entity.dart';

part 'teacher_list_get_model.g.dart';

@JsonSerializable()
class TeacherTotalListGetBaseModel extends TeacherTotalGetEntity {
  final TutorsListGetBaseModel? tutors;

  const TeacherTotalListGetBaseModel({
    this.tutors,
  });

  static TeacherTotalListGetBaseModel fromJson(Map<String, dynamic> json) =>
      _$TeacherTotalListGetBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherTotalListGetBaseModelToJson(this);
}

@JsonSerializable()
class TutorsListGetBaseModel extends TutorsListGetEntity {
  final int? count;
  final List<TutorItemGetBaseModel>? rows;

  const TutorsListGetBaseModel({
    this.count,
    this.rows,
  });

  static TutorsListGetBaseModel fromJson(Map<String, dynamic> json) =>
      _$TutorsListGetBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TutorsListGetBaseModelToJson(this);
}

@JsonSerializable()
class TutorItemGetBaseModel extends TutorItemGetEntity {
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

  const TutorItemGetBaseModel({
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

  static TutorItemGetBaseModel fromJson(Map<String, dynamic> json) =>
      _$TutorItemGetBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TutorItemGetBaseModelToJson(this);
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
