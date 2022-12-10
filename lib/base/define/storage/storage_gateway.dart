import 'package:lettutor_app/base/define/storage/types/default_storage.dart';
import 'package:lettutor_app/base/define/storage/types/secure_storage.dart';

import '../../../di/di_module.dart';
import 'storage_client.dart';

class StorageGateway {
  const StorageGateway({
    required this.storage,
  });

  final StorageClient storage;

  // factory StorageGateway.defaultGateway() => StorageGateway(
  //       storage: getIt.get<SecureStorage>(),
  //     );

  factory StorageGateway.secureGateway() => StorageGateway(
        storage: getIt.get<SecureStorage>(),
      );

  Future<bool> putString(String key, String value) =>
      storage.putString(key, value);

  Future<String?> getString(String key) => storage.getString(key);

  Future<bool> putInt(String key, int value) => storage.putInt(key, value);

  Future<int?> getInt(String key) => storage.getInt(key);

  Future<bool> putDouble(String key, double value) =>
      storage.putDouble(key, value);

  Future<double?> getDouble(String key) => storage.getDouble(key);

  Future<bool> putBool(String key, bool value) => storage.putBool(key, value);

  Future<bool?> getBool(String key) => storage.getBool(key);

  Future<bool> remove(String key) => storage.remove(key);

  Future clear() => storage.clear();
}
