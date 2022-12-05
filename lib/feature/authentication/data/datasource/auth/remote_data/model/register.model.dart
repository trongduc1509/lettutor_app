import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/feature/authentication/domain/enities/login_entity.dart';

import '../../../../../../../base/extension/time.dart';
import '../../../../../domain/enities/token_entity.dart';

part 'register.model.g.dart';

@JsonSerializable()
class RegisterBaseModel extends LoginEntity {
  final RegisterUserBaseModel? user;
  final TokensBaseModel? tokens;

  RegisterBaseModel({
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

  Map<String, dynamic> toJson() => _$RegisterBaseModelToJson(this);

  static RegisterBaseModel fromJson(Map<String, dynamic> json) =>
      _$RegisterBaseModelFromJson(json);
}

@JsonSerializable()
class RegisterUserBaseModel {
  final String? id;
  final String? email;
  final String? name;
  final String? avatar;
  final String? country;
  final String? phone;
  final String? language;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? birthday;
  final bool? isActivated;
  final String? requireNote;
  final String? level;
  final bool? isPhoneActivated;
  final int? timezone;
  final String? studySchedule;
  final bool? canSendMessage;

  const RegisterUserBaseModel({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.isActivated,
    this.requireNote,
    this.level,
    this.isPhoneActivated,
    this.timezone,
    this.studySchedule,
    this.canSendMessage,
  });

  static RegisterUserBaseModel fromJson(Map<String, dynamic> json) =>
      _$RegisterUserBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserBaseModelToJson(this);
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
  }) : super(tokenDetail: token, expDate: expires ?? endDay);

  static TokenItemBaseModel fromJson(Map<String, dynamic> json) =>
      _$TokenItemBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenItemBaseModelToJson(this);
}
