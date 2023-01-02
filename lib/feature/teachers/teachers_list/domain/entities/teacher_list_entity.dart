import '../../../../../base/extension/time.dart';

class TeacherTotalEntity {
  final int? count;
  final List<TutorItemEntity>? rows;

  const TeacherTotalEntity({
    this.count,
    this.rows = const [],
  });
}

class TutorItemEntity {
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

  const TutorItemEntity({
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
}
