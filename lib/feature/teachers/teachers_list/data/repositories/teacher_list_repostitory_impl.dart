import 'package:dartz/dartz.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/teacher_list_entity.dart';
import '../../domain/entities/teacher_list_get_entity.dart';
import '../../domain/repositories/teachers_repository.dart';
import '../datasources/teacher_list/remote_data/teacher_list_remote_datasource.dart';

class TeacherListRepositoryImpl extends TeacherListRepository {
  TeacherListRepositoryImpl();

  final TeacherListRemoteDatasource _teacherListRemoteDatasource =
      getIt.get<TeacherListRemoteDatasource>();

  @override
  Future<Either<AppException, TeacherTotalGetEntity>> getTeacherList(
      Map<String, dynamic> params, Map<String, dynamic> body) async {
    try {
      var result =
          await _teacherListRemoteDatasource.getTeacherList(params, body);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(AppException(
        error: e,
        displayMessage: 'Lỗi lấy danh sách giáo viên',
        displayTitle: 'Error while getting tutors list',
      ));
    }
  }

  @override
  Future<Either<AppException, TeacherTotalEntity>> searchTeacherList(
      Map<String, dynamic> params) async {
    try {
      var result = await _teacherListRemoteDatasource.searchTeacherList(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(AppException(
        error: e,
        displayMessage: 'Lỗi tìm kiếm danh sách giáo viên',
        displayTitle: 'Error while searching tutors list',
      ));
    }
  }

  @override
  Future<Either<AppException, dynamic>> manageFavTeacher(
      Map<String, dynamic> params) async {
    try {
      var result = await _teacherListRemoteDatasource.manageFavTeacher(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(AppException(
        error: e,
        displayMessage: 'Lỗi thêm hoặc xóa giáo viên ưa thích',
        displayTitle: 'Error while managing favorite tutor',
      ));
    }
  }
}
