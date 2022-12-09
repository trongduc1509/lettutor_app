import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_params.usecase.g.dart';

@JsonSerializable()
class RefreshTokenUseCaseParams {
  const RefreshTokenUseCaseParams({
    this.refreshToken,
    this.timezone = 7,
  });

  final String? refreshToken;
  final int? timezone;

  static RefreshTokenUseCaseParams fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenUseCaseParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenUseCaseParamsToJson(this);
}
