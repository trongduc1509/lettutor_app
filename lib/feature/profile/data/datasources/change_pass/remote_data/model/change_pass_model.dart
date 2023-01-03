import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/change_pass_entity.dart';

part 'change_pass_model.g.dart';

@JsonSerializable()
class ChangePassBaseModel extends ChangePassEntity {
  final int? statusCode;

  const ChangePassBaseModel({
    this.statusCode,
  });

  static ChangePassBaseModel fromJson(Map<String, dynamic> json) =>
      _$ChangePassBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePassBaseModelToJson(this);
}
