class TeacherTotalEntity {
  final TutorsListEntity? tutors;
  final List<TutorFavEntity>? favoriteTutor;

  const TeacherTotalEntity({
    this.tutors,
    this.favoriteTutor,
  });

  bool isFav(String tutorId) {
    if (favoriteTutor == null) return false;
    if (favoriteTutor!.isEmpty) return false;
    final indexCheck = favoriteTutor!
        .indexWhere((element) => element.secondInfo?.tutorInfo?.id == tutorId);
    return indexCheck != -1;
  }
}

class TutorsListEntity {
  final int? count;
  final List<TutorItemEntity>? rows;

  const TutorsListEntity({
    this.count = 0,
    this.rows = const [],
  });
}

class TutorItemEntity {
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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? studentGroupId;
  final List<TutorItemFeedbackEntity>? feedbacks;
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

  const TutorItemEntity({
    this.level = '',
    this.email = '',
    // this.google,
    // this.facebook,
    // this.apple,
    this.avatar = '',
    this.name = '',
    this.country = '',
    this.phone = '',
    this.language = '',
    this.birthday,
    this.requestPassword = false,
    this.isActivated = false,
    this.isPhoneActivated = false,
    this.requireNote = '',
    this.timezone = 0,
    //this.phoneAuth,
    this.isPhoneAuthActivated = false,
    //this.studySchedule,
    this.canSendMessage = false,
    this.isPublicRecord = false,
    //this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId = '',
    this.feedbacks = const [],
    this.id = '',
    this.userId = '',
    this.video = '',
    this.bio = '',
    this.education = '',
    this.experience = '',
    this.profession = '',
    //this.accent,
    this.targetStudent = '',
    this.interests = '',
    this.languages = '',
    this.specialties = '',
    //this.resume,
    this.rating = 0,
    this.isNative = false,
    this.price = 0,
    this.isOnline = false,
  });
}

class TutorItemFeedbackEntity {
  final String? id;
  final String? bookingId;
  final String? firstId;
  final String? secondId;
  final int? rating;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final TutorItemFeedbackFirstInfoEntity? firstInfo;

  const TutorItemFeedbackEntity({
    this.id = '',
    this.bookingId = '',
    this.firstId = '',
    this.secondId = '',
    this.rating = 0,
    this.content = '',
    this.createdAt,
    this.updatedAt,
    this.firstInfo,
  });
}

class TutorItemFeedbackFirstInfoEntity {
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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? studentGroupId;

  const TutorItemFeedbackFirstInfoEntity({
    this.level = '',
    this.email = '',
    // this.google,
    // this.facebook,
    // this.apple,
    this.avatar = '',
    this.name = '',
    this.country = '',
    this.phone = '',
    this.language = '',
    this.birthday,
    this.requestPassword = false,
    this.isActivated = false,
    this.isPhoneActivated = false,
    this.requireNote = '',
    this.timezone = 0,
    //this.phoneAuth,
    this.isPhoneAuthActivated = false,
    this.studySchedule = '',
    this.canSendMessage = false,
    this.isPublicRecord = false,
    //this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId = '',
  });
}

class TutorFavEntity {
  final String? id;
  final String? firstId;
  final String? secondId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final TutorFavSecInfoEntity? secondInfo;

  const TutorFavEntity({
    this.id = '',
    this.firstId = '',
    this.secondId = '',
    this.createdAt,
    this.updatedAt,
    this.secondInfo,
  });
}

class TutorFavSecInfoEntity {
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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? studentGroupId;
  final TutorFavTutorInfoEntity? tutorInfo;

  const TutorFavSecInfoEntity({
    this.id = '',
    this.level = '',
    this.email = '',
    // this.google,
    // this.facebook,
    // this.apple,
    this.avatar = '',
    this.name = '',
    this.country = '',
    this.phone = '',
    this.language = '',
    this.birthday,
    this.requestPassword = false,
    this.isActivated = false,
    this.isPhoneActivated = false,
    this.requireNote = '',
    this.timezone = 0,
    //this.phoneAuth,
    this.isPhoneAuthActivated = false,
    //this.studySchedule,
    this.canSendMessage = false,
    this.isPublicRecord = false,
    //this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId = '',
    this.tutorInfo,
  });
}

class TutorFavTutorInfoEntity {
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
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TutorFavTutorInfoEntity({
    this.id = '',
    this.userId = '',
    this.video = '',
    this.bio = '',
    this.education = '',
    this.experience = '',
    this.profession = '',
    this.accent = '',
    this.targetStudent = '',
    this.interests = '',
    this.languages = '',
    this.specialties = '',
    //this.resume,
    this.rating = 0,
    this.isActivated = false,
    this.isNative = false,
    this.createdAt,
    this.updatedAt,
  });
}
