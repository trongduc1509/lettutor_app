import 'package:lettutor_app/feature/authentication/domain/enities/token_entity.dart';

class LoginEntity {
  const LoginEntity({
    this.userId = '',
    this.userEmail = '',
    this.userName = '',
    this.userAvatar = '',
    this.userCountry = '',
    this.userPhone = '',
    this.userIsActivated = false,
    this.userIsPhoneActivated = false,
    this.accessToken = const TokenEntity(),
    this.refreshToken = const TokenEntity(),
  });

  final String? userId;
  final String? userEmail;
  final String? userName;
  final String? userAvatar;
  final String? userCountry;
  final String? userPhone;
  final bool? userIsActivated;
  final bool? userIsPhoneActivated;
  final TokenEntity? accessToken;
  final TokenEntity? refreshToken;
}
