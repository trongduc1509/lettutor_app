class TeacherDetailEntity {
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
  final TeacherDetailUserEntity? user;
  final bool? isFavorite;
  final double? avgRating;
  final int? totalFeedback;

  const TeacherDetailEntity({
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
    this.rating = 0,
    this.isNative = false,
    this.user,
    this.isFavorite = false,
    this.avgRating = 0,
    this.totalFeedback = 0,
  });
}

class TeacherDetailUserEntity {
  final String? id;
  final String? level;
  final String? avatar;
  final String? name;
  final String? country;
  final String? language;
  final bool? isPublicRecord;
  final String? caredByStaffId;
  final String? studentGroupId;
  final List<TeacherDetailUserCourseEntity>? courses;

  const TeacherDetailUserEntity({
    this.id = '',
    this.level = '',
    this.avatar = '',
    this.name = '',
    this.country = '',
    this.language = '',
    this.isPublicRecord = false,
    this.caredByStaffId = '',
    this.studentGroupId = '',
    this.courses = const [],
  });
}

class TeacherDetailUserCourseEntity {
  final String? id;
  final String? name;
  final TeacherDetailUserCourseTutorCourseEntity? tutorCourse;

  const TeacherDetailUserCourseEntity({
    this.id = '',
    this.name = '',
    this.tutorCourse,
  });
}

class TeacherDetailUserCourseTutorCourseEntity {
  final String? userId;
  final String? courseId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TeacherDetailUserCourseTutorCourseEntity({
    this.userId = '',
    this.courseId = '',
    this.createdAt,
    this.updatedAt,
  });
}
