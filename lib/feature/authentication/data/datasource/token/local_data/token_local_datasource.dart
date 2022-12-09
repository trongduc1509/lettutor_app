import '../../../../../../base/define/storage/consts/storage_consts.dart';
import '../../../../../../base/define/storage/storage_gateway.dart';
import '../../../../domain/enities/token_entity.dart';
import '../../../../../../base/extension/time.dart';

class TokenLocalDatasource {
  TokenLocalDatasource();

  final StorageGateway storageGateway = StorageGateway.secureGateway();

  Future<void> saveSession(
      TokenEntity accessToken, TokenEntity refreshToken) async {
    await Future.wait([
      storageGateway.putString(
          StorageConsts.tokenKey, accessToken.tokenDetail!),
      storageGateway.putString(
          StorageConsts.tokenExpKey, timeToJson(accessToken.expDate)!),
      storageGateway.putString(
          StorageConsts.refreshTokenKey, refreshToken.tokenDetail!),
      storageGateway.putString(
          StorageConsts.refreshTokenExpKey, timeToJson(refreshToken.expDate)!),
    ]);
    storageGateway.storage.sessionStorage[StorageConsts.tokenKey] = accessToken;
    storageGateway.storage.sessionStorage[StorageConsts.refreshTokenKey] =
        refreshToken;
  }

  Future<TokenEntity?> activateSavedToken() async {
    final accessToken = await storageGateway.getString(StorageConsts.tokenKey);
    final refreshToken =
        await storageGateway.getString(StorageConsts.refreshTokenKey);
    final accessExp = await storageGateway.getString(StorageConsts.tokenExpKey);
    final refreshExp =
        await storageGateway.getString(StorageConsts.refreshTokenExpKey);
    if (accessToken != null && refreshToken != null) {
      await saveSession(
          TokenEntity(tokenDetail: accessToken, expDate: jsonToTime(accessExp)),
          TokenEntity(
              tokenDetail: refreshToken, expDate: jsonToTime(refreshExp)));
    }
    return TokenEntity(
        tokenDetail: accessToken, expDate: jsonToTime(accessExp));
  }

  TokenEntity? getAccessToken() =>
      storageGateway.storage.sessionStorage[StorageConsts.tokenKey];

  TokenEntity? getRefreshToken() =>
      storageGateway.storage.sessionStorage[StorageConsts.refreshTokenKey];

  Future<void> clearTokenLocalData() async {
    await Future.wait([
      storageGateway.remove(StorageConsts.tokenKey),
      storageGateway.remove(StorageConsts.tokenExpKey),
      storageGateway.remove(StorageConsts.refreshTokenKey),
      storageGateway.remove(StorageConsts.refreshTokenExpKey),
    ]);
    storageGateway.storage.sessionStorage[StorageConsts.tokenKey] = null;
    storageGateway.storage.sessionStorage[StorageConsts.refreshTokenKey] = null;
  }
}
