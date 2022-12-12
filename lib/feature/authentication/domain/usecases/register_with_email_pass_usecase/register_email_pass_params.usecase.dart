import 'package:json_annotation/json_annotation.dart';

part 'register_email_pass_params.usecase.g.dart';

@JsonSerializable()
class RegisterEmailPassUseCaseParams {
  const RegisterEmailPassUseCaseParams({
    this.email,
    this.password,
  });

  final String? email;
  final String? password;

  static RegisterEmailPassUseCaseParams fromJson(Map<String, dynamic> json) =>
      _$RegisterEmailPassUseCaseParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterEmailPassUseCaseParamsToJson(this);
}
