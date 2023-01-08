import 'package:dartz/dartz.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../entities/book_class_entity.dart';

abstract class BookClassRepository {
  Future<Either<AppException, BookClassEntity>> bookClass(
      Map<String, dynamic> params);
}
