import 'package:dartz/dartz.dart';
import 'package:lettutor_app/feature/profile/domain/repositories/profile_repository.dart';

import '../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../base/define/usecase/usecase.base.dart';
import '../../entities/user_info_entity.dart';

class GetUserInfoUseCase
    with UseCase<void, Either<AppException, UserInfoEntity>> {
  const GetUserInfoUseCase({
    required this.profileRepo,
  });

  final ProfileRepository profileRepo;

  @override
  Future<Either<AppException, UserInfoEntity>> execute(void params) =>
      profileRepo.getUserInfo();
}
