// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginBaseModel _$LoginBaseModelFromJson(Map<String, dynamic> json) =>
    LoginBaseModel(
      user: json['user'] == null
          ? null
          : LoginUserBaseModel.fromJson(json['user'] as Map<String, dynamic>),
      tokens: json['tokens'] == null
          ? null
          : TokensBaseModel.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginBaseModelToJson(LoginBaseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'tokens': instance.tokens,
    };

LoginUserBaseModel _$LoginUserBaseModelFromJson(Map<String, dynamic> json) =>
    LoginUserBaseModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      language: json['language'] as String?,
      birthday: jsonToTime(json['birthday'] as String?),
      isActivated: json['isActivated'] as bool?,
      walletInfo: json['walletInfo'] == null
          ? null
          : WalletInfoBaseModel.fromJson(
              json['walletInfo'] as Map<String, dynamic>),
      courses:
          (json['courses'] as List<dynamic>?)?.map((e) => e as String).toList(),
      requireNote: json['requireNote'] as String?,
      level: json['level'] as String?,
      learnTopics: (json['learnTopics'] as List<dynamic>?)
          ?.map((e) => LearnTopicsBaseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      testPreparations: (json['testPreparations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      timezone: json['timezone'] as int?,
      studySchedule: json['studySchedule'] as String?,
      canSendMessage: json['canSendMessage'] as bool?,
    );

Map<String, dynamic> _$LoginUserBaseModelToJson(LoginUserBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'country': instance.country,
      'phone': instance.phone,
      'roles': instance.roles,
      'language': instance.language,
      'birthday': instance.birthday?.toIso8601String(),
      'isActivated': instance.isActivated,
      'walletInfo': instance.walletInfo,
      'courses': instance.courses,
      'requireNote': instance.requireNote,
      'level': instance.level,
      'learnTopics': instance.learnTopics,
      'testPreparations': instance.testPreparations,
      'isPhoneActivated': instance.isPhoneActivated,
      'timezone': instance.timezone,
      'studySchedule': instance.studySchedule,
      'canSendMessage': instance.canSendMessage,
    };

WalletInfoBaseModel _$WalletInfoBaseModelFromJson(Map<String, dynamic> json) =>
    WalletInfoBaseModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      amount: json['amount'] as String?,
      isBlocked: json['isBlocked'] as bool?,
      createdAt: jsonToTime(json['createdAt'] as String?),
      updatedAt: jsonToTime(json['updatedAt'] as String?),
      bonus: json['bonus'] as int?,
    );

Map<String, dynamic> _$WalletInfoBaseModelToJson(
        WalletInfoBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'isBlocked': instance.isBlocked,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'bonus': instance.bonus,
    };

LearnTopicsBaseModel _$LearnTopicsBaseModelFromJson(
        Map<String, dynamic> json) =>
    LearnTopicsBaseModel(
      id: json['id'] as int?,
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LearnTopicsBaseModelToJson(
        LearnTopicsBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
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
