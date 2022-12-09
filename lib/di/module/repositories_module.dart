import 'package:lettutor_app/feature/authentication/data/datasource/auth/remote_data/auth_remote_datasource.dart';
import 'package:lettutor_app/feature/user/data/datasources/user/remote_data/user_remote_datasource.dart';
import 'package:lettutor_app/feature/user/data/repositories/user_repository_impl.dart';

import '../../feature/authentication/data/repositories/authentication_repository_impl.dart';
import '../../feature/authentication/domain/repositories/authentication_repository.dart';

import '../di_module.dart';

class RepositoriesModule extends DIModule {
  @override
  Future<void> provides() async {
    //Authentication
    getIt
      ..registerLazySingleton<AuthenticationRemoteDatasource>(
          () => AuthenticationRemoteDatasource())
      ..registerLazySingleton<UserRemoteDatasource>(
          () => UserRemoteDatasource())
      ..registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl())
      ..registerLazySingleton(() => UserRepositoryImpl());
  }
}
