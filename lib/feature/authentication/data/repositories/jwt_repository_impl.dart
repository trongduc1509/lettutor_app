import 'package:lettutor_app/feature/authentication/domain/repositories/jwt_repository.dart';

class JwtRepoImpl extends JwtRepo {
  @override
  Future<void> cacheToken(response, String username) {
    // TODO: implement cacheToken
    throw UnimplementedError();
  }

  @override
  Future<bool> cleanCache() {
    // TODO: implement cleanCache
    throw UnimplementedError();
  }

  @override
  Future<bool> cleanRefreshToken() {
    // TODO: implement cleanRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<bool> cleanToken() {
    // TODO: implement cleanToken
    throw UnimplementedError();
  }

  @override
  Future<String> createOTP() {
    // TODO: implement createOTP
    throw UnimplementedError();
  }

  @override
  Future expiredRefreshToken() {
    // TODO: implement expiredRefreshToken
    throw UnimplementedError();
  }

  @override
  Future expiredToken() {
    // TODO: implement expiredToken
    throw UnimplementedError();
  }

  @override
  // TODO: implement getRefreshToken
  Future get getRefreshToken => throw UnimplementedError();

  @override
  // TODO: implement getToken
  Future get getToken => throw UnimplementedError();

  @override
  // TODO: implement hasRefreshToken
  Future<bool> get hasRefreshToken => throw UnimplementedError();

  @override
  Future login(request) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<String> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> setRefreshToken(tokenModel) {
    // TODO: implement setRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<bool> setToken(tokenModel) {
    // TODO: implement setToken
    throw UnimplementedError();
  }

  @override
  Future userInfo() {
    // TODO: implement userInfo
    throw UnimplementedError();
  }
}
