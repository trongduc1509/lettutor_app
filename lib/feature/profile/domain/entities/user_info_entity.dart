class UserInfoEntity {
  final String? userId;
  final String? userName;
  final String? userEmail;
  final String? userCountry;
  final String? userPhone;
  final DateTime? userDob;
  final String? userImg;

  const UserInfoEntity({
    this.userId = '',
    this.userName = '',
    this.userEmail = '',
    this.userCountry = '',
    this.userPhone = '',
    this.userDob,
    this.userImg = '',
  });
}
