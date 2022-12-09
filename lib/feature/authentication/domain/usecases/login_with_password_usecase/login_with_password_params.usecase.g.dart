// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_password_params.usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginWithPasswordUseCaseParams _$LoginWithPasswordUseCaseParamsFromJson(
        Map<String, dynamic> json) =>
    LoginWithPasswordUseCaseParams(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginWithPasswordUseCaseParamsToJson(
        LoginWithPasswordUseCaseParams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
