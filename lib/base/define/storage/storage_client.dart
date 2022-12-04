abstract class StorageClient {
  final Map<String, String> _sessionStorage = {};

  Future<void> start();

  Future<bool> putString(String key, String value);

  Future<String?> getString(String key);

  Future<bool> putInt(String key, int value);

  Future<bool> putBool(String key, bool value);

  Future<int?> getInt(String key);

  Future<bool> putDouble(String key, double value);

  Future<double?> getDouble(String key);

  Future<bool?> getBool(String key);

  Future<bool> remove(String key);

  Future clear();

  Map<String, String> get sessionStorage => _sessionStorage;
}
