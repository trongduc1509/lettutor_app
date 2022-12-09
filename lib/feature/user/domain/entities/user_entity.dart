class UserEntity {
  const UserEntity({
    this.userId = '',
    this.userEmail = '',
    this.userName = '',
    this.userAvatar = '',
    this.userCountry = '',
    this.userPhone = '',
    this.userIsActivated = false,
  });

  final String? userId;
  final String? userEmail;
  final String? userName;
  final String? userAvatar;
  final String? userCountry;
  final String? userPhone;
  final bool? userIsActivated;
}
