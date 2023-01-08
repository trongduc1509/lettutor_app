import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/book_class_entity.dart';

part 'book_class_model.g.dart';

@JsonSerializable(
  createToJson: false,
)
class BookClassModel extends BookClassEntity {
  final int? statusCode;
  final String? message;

  const BookClassModel({
    this.statusCode,
    this.message,
  });

  static BookClassModel fromJson(Map<String, dynamic> json) =>
      _$BookClassModelFromJson(json);
}
