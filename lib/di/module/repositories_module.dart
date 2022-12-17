import 'package:lettutor_app/feature/schedule/data/datasource/schedule/remote_data/schedule_remote_datasource.dart';
import 'package:lettutor_app/feature/schedule/data/repositories/schedule_repository_impl.dart';
import 'package:lettutor_app/feature/schedule/domain/repositories/schedule_repository.dart';

import '../../feature/authentication/data/datasource/auth/remote_data/auth_remote_datasource.dart';
import '../../feature/authentication/data/datasource/token/local_data/token_local_datasource.dart';
import '../../feature/authentication/data/repositories/authentication_repository_impl.dart';
import '../../feature/authentication/domain/repositories/authentication_repository.dart';
import '../../feature/courses/courses_list/data/datasources/courses_list/remote_data/courses_list_remote_datasource.dart';
import '../../feature/courses/courses_list/data/repositories/courses_list_repository_impl.dart';
import '../../feature/courses/courses_list/domain/repositories/courses_list_repository.dart';
import '../../feature/courses/detail/data/datasources/course_detail/remote_data/course_detail_remote_datasource.dart';
import '../../feature/courses/detail/data/repositories/course_detail_repository_impl.dart';
import '../../feature/courses/detail/domain/repositories/course_detail_repository.dart';
import '../../feature/profile/data/datasources/user_info/remote_data/user_info_remote_datasource.dart';
import '../../feature/profile/data/repositories/profile_repository_impl.dart';
import '../../feature/profile/domain/repositories/profile_repository.dart';
import '../../feature/teachers/detail/data/datasources/teacher_detail/remote_data/teacher_detail_remote_datasource.dart';
import '../../feature/teachers/detail/data/repositories/teacher_detail_repository_impl.dart';
import '../../feature/teachers/detail/domain/repositories/teacher_detail_repository.dart';
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
      ..registerLazySingleton<TeacherDetailRemoteDatasource>(
          () => TeacherDetailRemoteDatasource())
      ..registerLazySingleton<CoursesListRemoteDatasource>(
          () => CoursesListRemoteDatasource())
      ..registerLazySingleton<CourseDetailRemoteDatasource>(
          () => CourseDetailRemoteDatasource())
      ..registerLazySingleton<ScheduleRemoteDatasource>(
          () => ScheduleRemoteDatasource())
      ..registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl())
      ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl())
      ..registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl())
      ..registerLazySingleton<TeacherListRepository>(
          () => TeacherListRepositoryImpl())
      ..registerLazySingleton<TeacherDetailRepository>(
          () => TeacherDetailRepositoryImpl())
      ..registerLazySingleton<CoursesListRepository>(
          () => CoursesListRepositoryImpl())
      ..registerLazySingleton<CourseDetailRepository>(
          () => CourseDetailRepositoryImpl())
      ..registerLazySingleton<ScheduleRepository>(
          () => ScheduleRepositoryImpl());
  }
}
