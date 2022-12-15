import 'package:dartz/dartz.dart';

import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';

import '../../../../../di/di_module.dart';
import '../../domain/entities/teacher_detail_entity.dart';
import '../../domain/repositories/teacher_detail_repository.dart';
import '../datasources/teacher_detail/remote_data/teacher_detail_remote_datasource.dart';

class TeacherDetailRepositoryImpl extends TeacherDetailRepository {
  TeacherDetailRepositoryImpl();

  final TeacherDetailRemoteDatasource _teacherDetailRemoteDatasource =
      getIt.get<TeacherDetailRemoteDatasource>();

  @override
  Future<Either<AppException, TeacherDetailEntity>> getDetailTutor(
      String tutorId) async {
    try {
      var result = await _teacherDetailRemoteDatasource.getDetailTutor(tutorId);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(
        AppException(
          error: e,
          displayMessage: 'Lỗi lấy thông tin chi tiết giáo viên',
          displayTitle: 'Error while getting tutor detail information',
        ),
      );
    }
  }
}
