import 'package:dartz/dartz.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/course_detail_entity.dart';
import '../../domain/repositories/course_detail_repository.dart';
import '../datasources/course_detail/remote_data/course_detail_remote_datasource.dart';

class CourseDetailRepositoryImpl extends CourseDetailRepository {
  CourseDetailRepositoryImpl();

  final CourseDetailRemoteDatasource _courseDetailRemoteDatasource =
      getIt.get<CourseDetailRemoteDatasource>();

  @override
  Future<Either<AppException, CourseDetailResponseEntity>> getCourseDetail(
      String courseId) async {
    try {
      var result =
          await _courseDetailRemoteDatasource.getCourseDetail(courseId);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(AppException(
        error: e,
        displayMessage: 'Lỗi lấy thông tin chi tiết khóa học',
        displayTitle: 'Error while getting course detail information',
      ));
    }
  }
}
