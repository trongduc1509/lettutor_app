import 'package:dartz/dartz.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/book_class_entity.dart';
import '../../domain/repositories/book_class_repository.dart';
import '../datasource/remote/book_class/book_class_remote_datasource.dart';

class BookClassRepositoryImpl extends BookClassRepository {
  BookClassRepositoryImpl();

  final BookClassRemoteDatasource _bookClassRemoteDs =
      getIt.get<BookClassRemoteDatasource>();

  @override
  Future<Either<AppException, BookClassEntity>> bookClass(
      Map<String, dynamic> params) async {
    try {
      final result = await _bookClassRemoteDs.bookClass(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(
        AppException(
          error: e,
        ),
      );
    }
  }
}
