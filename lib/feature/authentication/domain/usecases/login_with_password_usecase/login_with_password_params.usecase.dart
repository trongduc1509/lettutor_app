import 'package:json_annotation/json_annotation.dart';

part 'login_with_password_params.usecase.g.dart';

@JsonSerializable()
class LoginWithPasswordUseCaseParams {
  final String? email;
  final String? password;

  const LoginWithPasswordUseCaseParams({
    this.email,
    this.password,
  });

  static LoginWithPasswordUseCaseParams fromJson(Map<String, dynamic> json) =>
      _$LoginWithPasswordUseCaseParamsFromJson(json);

  Map<String, dynamic> toJson() => _$LoginWithPasswordUseCaseParamsToJson(this);
}
