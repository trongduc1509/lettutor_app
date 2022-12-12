// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoBaseModel _$UserInfoBaseModelFromJson(Map<String, dynamic> json) =>
    UserInfoBaseModel(
      user: json['user'] == null
          ? null
          : UserInfoDetailBaseModel.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoBaseModelToJson(UserInfoBaseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

UserInfoDetailBaseModel _$UserInfoDetailBaseModelFromJson(
        Map<String, dynamic> json) =>
    UserInfoDetailBaseModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      timezone: json['timezone'] as int?,
      canSendMessage: json['canSendMessage'] as bool?,
      avgRating: (json['avgRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserInfoDetailBaseModelToJson(
        UserInfoDetailBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'country': instance.country,
      'phone': instance.phone,
      'roles': instance.roles,
      'birthday': instance.birthday?.toIso8601String(),
      'isActivated': instance.isActivated,
      'walletInfo': instance.walletInfo,
      'requireNote': instance.requireNote,
      'level': instance.level,
      'learnTopics': instance.learnTopics,
      'isPhoneActivated': instance.isPhoneActivated,
      'timezone': instance.timezone,
      'canSendMessage': instance.canSendMessage,
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
