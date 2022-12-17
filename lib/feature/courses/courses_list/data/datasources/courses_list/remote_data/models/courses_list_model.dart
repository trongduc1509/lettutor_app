import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/courses_list_entity.dart';

part 'courses_list_model.g.dart';

@JsonSerializable(createToJson: false)
class CoursesListResponseModel extends CoursesListResponseEntity {
  final String? message;
  final CoursesListModel? data;

  const CoursesListResponseModel({
    this.message,
    this.data,
  }) : super(
          message: message,
          data: data,
        );

  static CoursesListResponseModel fromJson(Map<String, dynamic> json) =>
      _$CoursesListResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class CoursesListModel extends CoursesListEntity {
  final int? count;
  final List<CourseModel> rows;

  const CoursesListModel({
    this.count,
    this.rows = const [],
  }) : super(
          count: count,
          rows: rows,
        );

  static CoursesListModel fromJson(Map<String, dynamic> json) =>
      _$CoursesListModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class CourseModel extends CourseEntity {
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
  final bool? visible;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<CourseTopicModel> topics;
  final List<CourseCategoryModel> categories;

  const CourseModel({
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
  }) : super(
          id: id,
          name: name,
          description: description,
          imageUrl: imageUrl,
          level: level,
          reason: reason,
          purpose: purpose,
          otherDetails: otherDetails,
          defaultPrice: defaultPrice,
          coursePrice: coursePrice,
          visible: visible,
          createdAt: createdAt,
          updatedAt: updatedAt,
          topics: topics,
        );

  static CourseModel fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class CourseTopicModel extends CourseTopicEntity {
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

  const CourseTopicModel({
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
  }) : super(
          id: id,
          courseId: courseId,
          orderCourse: orderCourse,
          name: name,
          nameFile: nameFile,
          description: description,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static CourseTopicModel fromJson(Map<String, dynamic> json) =>
      _$CourseTopicModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class CourseCategoryModel extends CourseCategoryEntity {
  final String? id;
  final String? title;
  final String? description;
  final String? key;
  //final Null displayOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CourseCategoryModel({
    this.id,
    this.title,
    this.description,
    this.key,
    //this.displayOrder,
    this.createdAt,
    this.updatedAt,
  }) : super(
          id: id,
          title: title,
          description: description,
          key: key,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static CourseCategoryModel fromJson(Map<String, dynamic> json) =>
      _$CourseCategoryModelFromJson(json);
}
