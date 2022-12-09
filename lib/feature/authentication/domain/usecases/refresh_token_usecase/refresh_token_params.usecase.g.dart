// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_params.usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenUseCaseParams _$RefreshTokenUseCaseParamsFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenUseCaseParams(
      refreshToken: json['refreshToken'] as String?,
      timezone: json['timezone'] as int?,
    );

Map<String, dynamic> _$RefreshTokenUseCaseParamsToJson(
        RefreshTokenUseCaseParams instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'timezone': instance.timezone,
    };
