import 'package:json_annotation/json_annotation.dart';

part 'response_error.g.dart';

@JsonSerializable()
class ResponseError {
  const ResponseError({
    this.statusCode,
    this.message,
  });

  final int? statusCode;
  final String? message;

  static ResponseError fromJson(Map<String, dynamic> json) =>
      _$ResponseErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseErrorToJson(this);
}
