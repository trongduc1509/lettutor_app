import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_params.usecase.g.dart';

@JsonSerializable()
class ForgotPassUseCaseParams {
  const ForgotPassUseCaseParams({
    this.email,
  });

  final String? email;

  static ForgotPassUseCaseParams fromJson(Map<String, dynamic> json) =>
      _$ForgotPassUseCaseParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPassUseCaseParamsToJson(this);
}
