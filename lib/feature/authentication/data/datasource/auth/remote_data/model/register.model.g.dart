// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterBaseModel _$RegisterBaseModelFromJson(Map<String, dynamic> json) =>
    RegisterBaseModel(
      user: json['user'] == null
          ? null
          : RegisterUserBaseModel.fromJson(
              json['user'] as Map<String, dynamic>),
      tokens: json['tokens'] == null
          ? null
          : TokensBaseModel.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterBaseModelToJson(RegisterBaseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'tokens': instance.tokens,
    };

RegisterUserBaseModel _$RegisterUserBaseModelFromJson(
        Map<String, dynamic> json) =>
    RegisterUserBaseModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      language: json['language'] as String?,
      birthday: jsonToTime(json['birthday'] as String?),
      isActivated: json['isActivated'] as bool?,
      requireNote: json['requireNote'] as String?,
      level: json['level'] as String?,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      timezone: json['timezone'] as int?,
      studySchedule: json['studySchedule'] as String?,
      canSendMessage: json['canSendMessage'] as bool?,
    );

Map<String, dynamic> _$RegisterUserBaseModelToJson(
        RegisterUserBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'country': instance.country,
      'phone': instance.phone,
      'language': instance.language,
      'birthday': instance.birthday?.toIso8601String(),
      'isActivated': instance.isActivated,
      'requireNote': instance.requireNote,
      'level': instance.level,
      'isPhoneActivated': instance.isPhoneActivated,
      'timezone': instance.timezone,
      'studySchedule': instance.studySchedule,
      'canSendMessage': instance.canSendMessage,
    };

TokensBaseModel _$TokensBaseModelFromJson(Map<String, dynamic> json) =>
    TokensBaseModel(
      access: json['access'] == null
          ? null
          : TokenItemBaseModel.fromJson(json['access'] as Map<String, dynamic>),
      refresh: json['refresh'] == null
          ? null
          : TokenItemBaseModel.fromJson(
              json['refresh'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokensBaseModelToJson(TokensBaseModel instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

TokenItemBaseModel _$TokenItemBaseModelFromJson(Map<String, dynamic> json) =>
    TokenItemBaseModel(
      token: json['token'] as String?,
      expires: jsonToTime(json['expires'] as String?),
    );

Map<String, dynamic> _$TokenItemBaseModelToJson(TokenItemBaseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires?.toIso8601String(),
    };
