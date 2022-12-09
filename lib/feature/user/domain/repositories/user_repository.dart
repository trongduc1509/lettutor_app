//import 'package:rxdart/rxdart.dart';

import 'package:dartz/dartz.dart';
import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';
import '../../../authentication/domain/enities/token_entity.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  //BehaviorSubject<>
  Future<Either<AppException, UserEntity>> getUserInformation();
}
