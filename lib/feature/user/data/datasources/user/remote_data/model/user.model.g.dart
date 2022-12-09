// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBaseModel _$UserBaseModelFromJson(Map<String, dynamic> json) =>
    UserBaseModel(
      user: json['user'] == null
          ? null
          : UserItemBaseModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserBaseModelToJson(UserBaseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

UserItemBaseModel _$UserItemBaseModelFromJson(Map<String, dynamic> json) =>
    UserItemBaseModel(
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
      referralInfo: json['referralInfo'] == null
          ? null
          : ReferralInfoBaseModel.fromJson(
              json['referralInfo'] as Map<String, dynamic>),
      studySchedule: json['studySchedule'] as String?,
      canSendMessage: json['canSendMessage'] as bool?,
      studentGroup: json['studentGroup'] as String?,
      avgRating: json['avgRating'] as int?,
    );

Map<String, dynamic> _$UserItemBaseModelToJson(UserItemBaseModel instance) =>
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
      'requireNote': instance.requireNote,
      'level': instance.level,
      'learnTopics': instance.learnTopics,
      'testPreparations': instance.testPreparations,
      'isPhoneActivated': instance.isPhoneActivated,
      'timezone': instance.timezone,
      'referralInfo': instance.referralInfo,
      'studySchedule': instance.studySchedule,
      'canSendMessage': instance.canSendMessage,
      'studentGroup': instance.studentGroup,
      'avgRating': instance.avgRating,
    };

WalletInfoBaseModel _$WalletInfoBaseModelFromJson(Map<String, dynamic> json) =>
    WalletInfoBaseModel(
      amount: json['amount'] as String?,
      isBlocked: json['isBlocked'] as bool?,
      bonus: json['bonus'] as int?,
    );

Map<String, dynamic> _$WalletInfoBaseModelToJson(
        WalletInfoBaseModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'isBlocked': instance.isBlocked,
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

ReferralInfoBaseModel _$ReferralInfoBaseModelFromJson(
        Map<String, dynamic> json) =>
    ReferralInfoBaseModel(
      referralCode: json['referralCode'] as String?,
      referralPackInfo: json['referralPackInfo'] == null
          ? null
          : ReferralPackInfoBaseModel.fromJson(
              json['referralPackInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReferralInfoBaseModelToJson(
        ReferralInfoBaseModel instance) =>
    <String, dynamic>{
      'referralCode': instance.referralCode,
      'referralPackInfo': instance.referralPackInfo,
    };

ReferralPackInfoBaseModel _$ReferralPackInfoBaseModelFromJson(
        Map<String, dynamic> json) =>
    ReferralPackInfoBaseModel(
      earnPercent: json['earnPercent'] as int?,
    );

Map<String, dynamic> _$ReferralPackInfoBaseModelToJson(
        ReferralPackInfoBaseModel instance) =>
    <String, dynamic>{
      'earnPercent': instance.earnPercent,
    };
