import 'package:json_annotation/json_annotation.dart';
import '../../../../../../../base/extension/time.dart';
import '../../../../../domain/entities/user_entity.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserBaseModel extends UserEntity {
  final UserItemBaseModel? user;

  UserBaseModel({
    this.user,
  }) : super(
          userId: user?.id,
          userEmail: user?.email,
          userName: user?.name,
          userAvatar: user?.avatar,
          userCountry: user?.country,
          userPhone: user?.phone,
          userIsActivated: user?.isActivated,
        );

  static UserBaseModel fromJson(Map<String, dynamic> json) =>
      _$UserBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserBaseModelToJson(this);
}

@JsonSerializable()
class UserItemBaseModel {
  final String? id;
  final String? email;
  final String? name;
  final String? avatar;
  final String? country;
  final String? phone;
  final List<String>? roles;
  final String? language;
  @JsonKey(fromJson: jsonToTime)
  final DateTime? birthday;
  final bool? isActivated;
  //Null? tutorInfo;
  final WalletInfoBaseModel? walletInfo;
  final String? requireNote;
  final String? level;
  final List<LearnTopicsBaseModel>? learnTopics;
  final List<String>? testPreparations;
  final bool? isPhoneActivated;
  final int? timezone;
  final ReferralInfoBaseModel? referralInfo;
  final String? studySchedule;
  final bool? canSendMessage;
  final String? studentGroup;
  //Null? studentInfo;
  final int? avgRating;

  const UserItemBaseModel({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    //this.tutorInfo,
    this.walletInfo,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.referralInfo,
    this.studySchedule,
    this.canSendMessage,
    this.studentGroup,
    //this.studentInfo,
    this.avgRating,
  });

  static UserItemBaseModel fromJson(Map<String, dynamic> json) =>
      _$UserItemBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserItemBaseModelToJson(this);
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

@JsonSerializable()
class ReferralInfoBaseModel {
  final String? referralCode;
  final ReferralPackInfoBaseModel? referralPackInfo;

  const ReferralInfoBaseModel({
    this.referralCode,
    this.referralPackInfo,
  });

  static ReferralInfoBaseModel fromJson(Map<String, dynamic> json) =>
      _$ReferralInfoBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralInfoBaseModelToJson(this);
}

@JsonSerializable()
class ReferralPackInfoBaseModel {
  final int? earnPercent;

  const ReferralPackInfoBaseModel({
    this.earnPercent,
  });

  static ReferralPackInfoBaseModel fromJson(Map<String, dynamic> json) =>
      _$ReferralPackInfoBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralPackInfoBaseModelToJson(this);
}
