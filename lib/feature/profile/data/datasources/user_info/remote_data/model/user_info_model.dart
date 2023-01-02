import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_app/feature/profile/domain/entities/user_info_entity.dart';

import '../../../../../../../base/extension/time.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoBaseModel {
  final UserInfoDetailBaseModel? user;

  const UserInfoBaseModel({
    this.user,
  });

  static UserInfoBaseModel fromJson(Map<String, dynamic> json) =>
      _$UserInfoBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoBaseModelToJson(this);
}

@JsonSerializable()
class UserInfoDetailBaseModel extends UserInfoEntity {
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
  //final String? tutorInfo;
  final WalletInfoBaseModel? walletInfo;
  final String? requireNote;
  final String? level;
  final List<LearnTopicsBaseModel>? learnTopics;
  final bool? isPhoneActivated;
  final int? timezone;
  final bool? canSendMessage;
  final double? avgRating;

  const UserInfoDetailBaseModel({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.birthday,
    this.isActivated,
    this.walletInfo,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.isPhoneActivated,
    this.timezone,
    this.canSendMessage,
    this.avgRating,
  }) : super(
          userId: id,
          userName: name,
          userEmail: email,
          userCountry: country,
          userPhone: phone,
          userDob: birthday,
          userImg: avatar,
          userLevel: level,
        );

  static UserInfoDetailBaseModel fromJson(Map<String, dynamic> json) =>
      _$UserInfoDetailBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoDetailBaseModelToJson(this);
}

@JsonSerializable()
class WalletInfoBaseModel {
  final String? amount;
  final bool? isBlocked;
  final int? bonus;

  const WalletInfoBaseModel({
    this.amount,
    this.isBlocked,
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
