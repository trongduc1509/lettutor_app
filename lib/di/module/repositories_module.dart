import '../../feature/authentication/data/datasource/auth/remote_data/auth_remote_datasource.dart';
import '../../feature/authentication/data/datasource/token/local_data/token_local_datasource.dart';
import '../../feature/authentication/data/repositories/authentication_repository_impl.dart';
import '../../feature/authentication/domain/repositories/authentication_repository.dart';
import '../../feature/profile/data/datasources/user_info/remote_data/user_info_remote_datasource.dart';
import '../../feature/profile/data/repositories/profile_repository_impl.dart';
import '../../feature/profile/domain/repositories/profile_repository.dart';
import '../../feature/teachers/teachers_list/data/datasources/teacher_list/remote_data/teacher_list_remote_datasource.dart';
import '../../feature/teachers/teachers_list/data/repositories/teacher_list_repostitory_impl.dart';
import '../../feature/teachers/teachers_list/domain/repositories/teachers_repository.dart';
import '../../feature/user/data/datasources/user/remote_data/user_remote_datasource.dart';
import '../../feature/user/data/repositories/user_repository_impl.dart';
import '../../feature/user/domain/repositories/user_repository.dart';
import '../di_module.dart';

class RepositoriesModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<AuthenticationRemoteDatasource>(
          () => AuthenticationRemoteDatasource())
      ..registerLazySingleton<TokenLocalDatasource>(
          () => TokenLocalDatasource())
      ..registerLazySingleton<UserRemoteDatasource>(
          () => UserRemoteDatasource())
      ..registerLazySingleton<UserInfoRemoteDatasource>(
          () => UserInfoRemoteDatasource())
      ..registerLazySingleton<TeacherListRemoteDatasource>(
          () => TeacherListRemoteDatasource())
      ..registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl())
      ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl())
      ..registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl())
      ..registerLazySingleton<TeacherListRepository>(
          () => TeacherListRepositoryImpl());
  }
}
