import 'dart:async';

import 'package:flutter/foundation.dart';

import '../storage_client.dart';

typedef OnDataChange<T> = void Function(T? current, T? previous);

class _StorageData<T> {
  const _StorageData(this.current, this.previous);

  final T? current;
  final T? previous;

  _StorageData<T> setCurrent(T? current) {
    return _StorageData<T>(current, this.current);
  }

  bool get isChange => current != previous;
}

class DataChangeListener<T> {
  DataChangeListener(
    this.key, {
    required this.storageClient,
    this.timestep = 2,
    required this.onDataChange,
  });

  final String key;
  final StorageClient storageClient;
  final OnDataChange<T> onDataChange;
  final int timestep;
  _StorageData<T> data = _StorageData<T>(null, null);
  late final Timer _timer;

  void listen() {
    runZonedGuarded(
      () {
        _timer = Timer.periodic(Duration(seconds: timestep), (timer) async {
          if (T == String) {
            var value = await storageClient.getString(key);
            data = data.setCurrent(value as T?);
          } else if (T == int) {
            var value = await storageClient.getInt(key);
            data = data.setCurrent(value as T?);
          } else if (T == double) {
            var value = await storageClient.getDouble(key);
            data = data.setCurrent(value as T?);
          } else if (T == bool) {
            var value = await storageClient.getBool(key);
            data = data.setCurrent(value as T?);
          }
          if (data.isChange) {
            onDataChange.call(data.current, data.previous);
          }
        });
      },
      (error, stack) {
        if (kDebugMode) {
          print(error);
        }
      },
    );
  }

  void dispose() {
    runZonedGuarded(
      () {
        _timer.cancel();
      },
      (error, stack) {
        if (kDebugMode) {
          print(error);
        }
      },
    );
  }
}
