import 'package:dartz/dartz.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../base/define/usecase/usecase.base.dart';
import '../../entities/book_class_entity.dart';
import '../../repositories/book_class_repository.dart';
import 'book_class_usecase_params.dart';

class BookClassUseCase
    with
        UseCase<BookClassUseCaseParams, Either<AppException, BookClassEntity>> {
  const BookClassUseCase({
    required this.bookClassRepository,
  });

  final BookClassRepository bookClassRepository;

  @override
  Future<Either<AppException, BookClassEntity>> execute(
          BookClassUseCaseParams params) =>
      bookClassRepository.bookClass(params.toJson());
}
