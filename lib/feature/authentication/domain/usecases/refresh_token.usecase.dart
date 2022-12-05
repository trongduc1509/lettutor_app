class RefreshTokenUseCase extends UseCase<LoginResponse> {
  RefreshTokenUseCase();

  final _repo = JwtService.inst.repo;
  final _userManager = JwtService.inst.userManager;

  @override
  Future<LoginResponse> execute() async {
    final response = await _repo.refreshToken();
    await _repo.cacheToken(response, _userManager.current!);
    if (!LoginSuccess(response).valid()) {
      JwtService.inst.userManager.expired();
    }
    return response;
  }
}
