import 'package:lettutor_app/base/define/usecase/usecase.base.dart';
import 'package:lettutor_app/feature/authentication/domain/repositories/authentication_repository.dart';

class LogoutUseCase with UseCase<void, void> {
  const LogoutUseCase({
    required this.authRepo,
  });

  final AuthenticationRepository authRepo;

  @override
  Future<void> execute(void params) => authRepo.clearUserData();
}
