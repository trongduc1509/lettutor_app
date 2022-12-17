class CoursesListResponseEntity {
  final String? message;
  final CoursesListEntity? data;

  const CoursesListResponseEntity({
    this.message,
    this.data,
  });
}

class CoursesListEntity {
  final int? count;
  final List<CourseEntity> rows;

  const CoursesListEntity({
    this.count,
    this.rows = const [],
  });
}

class CourseEntity {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? level;
  final String? reason;
  final String? purpose;
  final String? otherDetails;
  final int? defaultPrice;
  final int? coursePrice;
  //final Null courseType;
  //final Null sectionType;
  final bool? visible;
  //final Null displayOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<CourseTopicEntity> topics;
  final List<CourseCategoryEntity> categories;

  const CourseEntity({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.otherDetails,
    this.defaultPrice,
    this.coursePrice,
    //this.courseType,
    //this.sectionType,
    this.visible,
    //this.displayOrder,
    this.createdAt,
    this.updatedAt,
    this.topics = const [],
    this.categories = const [],
  });
}

class CourseTopicEntity {
  final String? id;
  final String? courseId;
  final int? orderCourse;
  final String? name;
  final String? nameFile;
  //final Null numberOfPages;
  final String? description;
  //final Null videoUrl;
  //final Null type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CourseTopicEntity({
    this.id,
    this.courseId,
    this.orderCourse,
    this.name,
    this.nameFile,
    //this.numberOfPages,
    this.description,
    //this.videoUrl,
    //this.type,
    this.createdAt,
    this.updatedAt,
  });
}

class CourseCategoryEntity {
  final String? id;
  final String? title;
  final String? description;
  final String? key;
  //final Null displayOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CourseCategoryEntity({
    this.id,
    this.title,
    this.description,
    this.key,
    //this.displayOrder,
    this.createdAt,
    this.updatedAt,
  });
}
