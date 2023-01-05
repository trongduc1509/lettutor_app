import 'package:dartz/dartz.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/courses_list_entity.dart';
import '../../domain/repositories/courses_list_repository.dart';
import '../datasources/courses_list/remote_data/courses_list_remote_datasource.dart';

class CoursesListRepositoryImpl extends CoursesListRepository {
  CoursesListRepositoryImpl();

  final CoursesListRemoteDatasource _coursesListRemoteDatasource =
      getIt.get<CoursesListRemoteDatasource>();

  @override
  Future<Either<AppException, CoursesListResponseEntity>> getCoursesList(
      Map<String, dynamic> param) async {
    try {
      var result = await _coursesListRemoteDatasource.getCoursesList(param);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(AppException(
        error: e,
        displayMessage: 'Lỗi lấy danh sách khóa học',
        displayTitle: 'Error while getting courses list',
      ));
    }
  }
}
