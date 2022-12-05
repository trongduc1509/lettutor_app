import 'package:flutter/material.dart';

abstract class JwtRepo {
  const JwtRepo(
    this.jwtConfig,
  );

  final JwtDefaultConfig jwtConfig;

  Future<TokenModel?> get getToken;

  @visibleForTesting
  Future<TokenModel?> get getRefreshToken;

  Future<bool> get hasRefreshToken;

  Future<bool> setToken(TokenModel tokenModel);

  @visibleForTesting
  Future<bool> setRefreshToken(TokenModel tokenModel);

  @visibleForTesting
  Future<bool> cleanToken();

  @visibleForTesting
  Future<bool> cleanRefreshToken();

  Future<LoginResponse> login(LoginRequest request);

  Future<dynamic> refreshToken();

  Future<bool> cleanCache();

  Future<UserProfile> userInfo();

  @visibleForTesting
  Future<void> cacheToken(LoginResponse response, String username);

  Future<String> resetPassword();

  Future<String> createOTP();

  /// for debug only
  @visibleForTesting
  Future<TokenModel?> expiredToken();

  /// for debug only
  @visibleForTesting
  Future<TokenModel?> expiredRefreshToken();
}
