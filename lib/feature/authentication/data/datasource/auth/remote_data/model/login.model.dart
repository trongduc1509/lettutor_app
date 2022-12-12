import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/base/extension/time.dart';
import 'package:lettutor_app/feature/authentication/domain/enities/token_entity.dart';

import '../../../../../domain/enities/login_entity.dart';

part 'login.model.g.dart';

@JsonSerializable()
class LoginBaseModel extends LoginEntity {
  final LoginUserBaseModel? user;
  final TokensBaseModel? tokens;

  LoginBaseModel({
    this.user,
    this.tokens,
  }) : super(
          userId: user?.id,
          userEmail: user?.email,
          userName: user?.name,
          userAvatar: user?.avatar,
          userCountry: user?.country,
          userPhone: user?.phone,
          userIsActivated: user?.isActivated,
          userIsPhoneActivated: user?.isPhoneActivated,
          accessToken: tokens?.access,
          refreshToken: tokens?.refresh,
        );

  Map<String, dynamic> toJson() => _$LoginBaseModelToJson(this);

  static LoginBaseModel fromJson(Map<String, dynamic> json) =>
      _$LoginBaseModelFromJson(json);
}

@JsonSerializable()
class LoginUserBaseModel {
  final String? id;
  final String? email;
  final String? name;
  final String? avatar;
  final String? country;
  final String? phone;
  final List<String>? roles;
  //final String? language;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? birthday;
  final bool? isActivated;
  final WalletInfoBaseModel? walletInfo;
  //final List<String>? courses;
  final String? requireNote;
  final String? level;
  final List<LearnTopicsBaseModel>? learnTopics;
  //final List<String>? testPreparations;
  final bool? isPhoneActivated;
  final int? timezone;
  //final String? studySchedule;
  final bool? canSendMessage;

  const LoginUserBaseModel({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    //this.language,
    this.birthday,
    this.isActivated,
    this.walletInfo,
    //this.courses,
    this.requireNote,
    this.level,
    this.learnTopics,
    //this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    //this.studySchedule,
    this.canSendMessage,
  });

  static LoginUserBaseModel fromJson(Map<String, dynamic> json) =>
      _$LoginUserBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserBaseModelToJson(this);
}

@JsonSerializable()
class WalletInfoBaseModel {
  final String? id;
  final String? userId;
  final String? amount;
  final bool? isBlocked;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? createdAt;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? updatedAt;
  final int? bonus;

  const WalletInfoBaseModel({
    this.id,
    this.userId,
    this.amount,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
    this.bonus,
  });

  static WalletInfoBaseModel fromJson(Map<String, dynamic> json) =>
      _$WalletInfoBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletInfoBaseModelToJson(this);
}

@JsonSerializable()
class LearnTopicsBaseModel {
  final int? id;
  final String? key;
  final String? name;

  const LearnTopicsBaseModel({
    this.id,
    this.key,
    this.name,
  });

  static LearnTopicsBaseModel fromJson(Map<String, dynamic> json) =>
      _$LearnTopicsBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LearnTopicsBaseModelToJson(this);
}

@JsonSerializable()
class TokensBaseModel {
  final TokenItemBaseModel? access;
  final TokenItemBaseModel? refresh;

  const TokensBaseModel({
    this.access,
    this.refresh,
  });

  static TokensBaseModel fromJson(Map<String, dynamic> json) =>
      _$TokensBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokensBaseModelToJson(this);
}

@JsonSerializable()
class TokenItemBaseModel extends TokenEntity {
  final String? token;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? expires;

  TokenItemBaseModel({
    this.token,
    this.expires,
  }) : super(tokenDetail: token, expDate: expires ?? startDay);

  static TokenItemBaseModel fromJson(Map<String, dynamic> json) =>
      _$TokenItemBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenItemBaseModelToJson(this);
}
