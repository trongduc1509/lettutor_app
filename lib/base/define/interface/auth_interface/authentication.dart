import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../apigateway/exception/app_exception.dart';
import 'auth.dart';
import 'login_ui.base.dart';

Authentication? _inst;

abstract class Authentication<AuthModel> extends ValueNotifier<Auth> {
  Authentication.impl({Auth? value, this.ui}) : super(value ?? Auth.unknown);

  static set<T>(Authentication<T> authen) {
    _inst = authen;
  }

  static bool get isInitialized => _inst != null;

  factory Authentication() => _inst as Authentication<AuthModel>;

  final LoginUI? ui;

  Auth get state => value;

  AuthModel? get current;

  AuthModel? get previous;

  List<Interceptor> get interceptors;

  Future<Either<AppException, AuthModel>> login(Map<String, dynamic> request);

  Future<Either<AppException, AuthModel>> logout(
      [Map<String, dynamic> request]);

  Future<Either<AppException, AuthModel>> refreshToken(
      Map<String, dynamic> request);
}
