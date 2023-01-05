import 'package:equatable/equatable.dart';

import '../../../../../base/extension/time.dart';

class TeacherTotalGetEntity extends Equatable {
  final TutorsListGetEntity? tutors;
  // final List<TutorFavEntity>? favoriteTutor;

  const TeacherTotalGetEntity({
    this.tutors = const TutorsListGetEntity(),
    // this.favoriteTutor,
  });

  // bool isFav(String tutorId) {
  //   if (favoriteTutor == null) return false;
  //   if (favoriteTutor!.isEmpty) return false;
  //   final indexCheck = favoriteTutor!
  //       .indexWhere((element) => element.secondInfo?.tutorInfo?.id == tutorId);
  //   return indexCheck != -1;
  // }

  TutorItemGetEntity getTutorById(String id) {
    if (tutors == null || tutors!.rows == null || tutors!.rows!.isEmpty) {
      return const TutorItemGetEntity();
    }

    var indexFind = tutors!.rows!.indexWhere(
      (element) => element.id == id,
    );
    return indexFind != -1
        ? tutors!.rows![indexFind]
        : const TutorItemGetEntity();
  }

  @override
  List<Object?> get props => [
        tutors,
      ];
}

class TutorsListGetEntity extends Equatable {
  final int? count;
  final List<TutorItemGetEntity>? rows;

  const TutorsListGetEntity({
    this.count = 0,
    this.rows = const [],
  });

  @override
  List<Object?> get props => [
        count,
        rows,
      ];
}

class TutorItemGetEntity extends Equatable {
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

  const TutorItemGetEntity({
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

  @override
  List<Object?> get props => [
        level,
        email,
        // this.google,
        // this.facebook,
        // this.apple,
        avatar,
        name,
        country,
        phone,
        language,
        birthday,
        requestPassword,
        isActivated,
        isPhoneActivated,
        requireNote,
        timezone,
        //this.phoneAuth,
        isPhoneAuthActivated,
        //this.studySchedule,
        canSendMessage,
        isPublicRecord,
        //this.caredByStaffId,
        createdAt,
        updatedAt,
        deletedAt,
        studentGroupId,
        feedbacks,
        id,
        userId,
        video,
        bio,
        education,
        experience,
        profession,
        //this.accent,
        targetStudent,
        interests,
        languages,
        specialties,
        //this.resume,
        rating,
        isNative,
        price,
        isOnline,
      ];
}

class TutorItemFeedbackEntity extends Equatable {
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

  String getUpdatedAt({required bool containTime}) =>
      updatedAt?.convertDateByFormat(containTime: containTime) ?? '';

  @override
  List<Object?> get props => [
        id,
        bookingId,
        firstId,
        secondId,
        rating,
        content,
        createdAt,
        updatedAt,
        firstInfo,
      ];
}

class TutorItemFeedbackFirstInfoEntity extends Equatable {
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

  @override
  List<Object?> get props => [
        level,
        email,
        // this.google,
        // this.facebook,
        // this.apple,
        avatar,
        name,
        country,
        phone,
        language,
        birthday,
        requestPassword,
        isActivated,
        isPhoneActivated,
        requireNote,
        timezone,
        //this.phoneAuth,
        isPhoneAuthActivated,
        studySchedule,
        canSendMessage,
        isPublicRecord,
        //this.caredByStaffId,
        createdAt,
        updatedAt,
        deletedAt,
        studentGroupId,
      ];
}

// class TutorFavEntity {
//   final String? id;
//   final String? firstId;
//   final String? secondId;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final TutorFavSecInfoEntity? secondInfo;

//   const TutorFavEntity({
//     this.id = '',
//     this.firstId = '',
//     this.secondId = '',
//     this.createdAt,
//     this.updatedAt,
//     this.secondInfo,
//   });
// }

// class TutorFavSecInfoEntity {
//   final String? id;
//   final String? level;
//   final String? email;
//   //final Null? google;
//   //final Null? facebook;
//   //final Null? apple;
//   final String? avatar;
//   final String? name;
//   final String? country;
//   final String? phone;
//   final String? language;
//   final DateTime? birthday;
//   final bool? requestPassword;
//   final bool? isActivated;
//   final bool? isPhoneActivated;
//   final String? requireNote;
//   final int? timezone;
//   //final Null? phoneAuth;
//   final bool? isPhoneAuthActivated;
//   //final Null? studySchedule;
//   final bool? canSendMessage;
//   final bool? isPublicRecord;
//   //final Null? caredByStaffId;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final DateTime? deletedAt;
//   final String? studentGroupId;
//   final TutorFavTutorInfoEntity? tutorInfo;

//   const TutorFavSecInfoEntity({
//     this.id = '',
//     this.level = '',
//     this.email = '',
//     // this.google,
//     // this.facebook,
//     // this.apple,
//     this.avatar = '',
//     this.name = '',
//     this.country = '',
//     this.phone = '',
//     this.language = '',
//     this.birthday,
//     this.requestPassword = false,
//     this.isActivated = false,
//     this.isPhoneActivated = false,
//     this.requireNote = '',
//     this.timezone = 0,
//     //this.phoneAuth,
//     this.isPhoneAuthActivated = false,
//     //this.studySchedule,
//     this.canSendMessage = false,
//     this.isPublicRecord = false,
//     //this.caredByStaffId,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.studentGroupId = '',
//     this.tutorInfo,
//   });
// }

// class TutorFavTutorInfoEntity {
//   final String? id;
//   final String? userId;
//   final String? video;
//   final String? bio;
//   final String? education;
//   final String? experience;
//   final String? profession;
//   final String? accent;
//   final String? targetStudent;
//   final String? interests;
//   final String? languages;
//   final String? specialties;
//   //final Null? resume;
//   final double? rating;
//   final bool? isActivated;
//   final bool? isNative;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   const TutorFavTutorInfoEntity({
//     this.id = '',
//     this.userId = '',
//     this.video = '',
//     this.bio = '',
//     this.education = '',
//     this.experience = '',
//     this.profession = '',
//     this.accent = '',
//     this.targetStudent = '',
//     this.interests = '',
//     this.languages = '',
//     this.specialties = '',
//     //this.resume,
//     this.rating = 0,
//     this.isActivated = false,
//     this.isNative = false,
//     this.createdAt,
//     this.updatedAt,
//   });
// }