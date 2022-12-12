import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/feature/authentication/domain/enities/forgot_pass_entity.dart';

part 'forgot_password.model.g.dart';

@JsonSerializable()
class ForgotPassBaseModel extends ForgotPassEntity {
  const ForgotPassBaseModel({
    this.message,
  }) : super(
          forgotPassMessage: message,
        );

  final String? message;

  static ForgotPassBaseModel fromJson(Map<String, dynamic> json) =>
      _$ForgotPassBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPassBaseModelToJson(this);
}
