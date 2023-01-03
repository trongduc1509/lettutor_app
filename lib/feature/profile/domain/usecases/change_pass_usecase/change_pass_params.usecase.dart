import 'package:json_annotation/json_annotation.dart';

part 'change_pass_params.usecase.g.dart';

@JsonSerializable(createFactory: false)
class ChangePassUseCaseParams {
  const ChangePassUseCaseParams({
    this.password,
    this.newPassword,
  });

  final String? password;
  final String? newPassword;

  Map<String, dynamic> toJson() => _$ChangePassUseCaseParamsToJson(this);
}
