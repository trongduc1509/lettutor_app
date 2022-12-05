import '../../../../../../../base/define/resource/resource.base.dart';

class LoginResource extends Resource {
  const LoginResource()
      : super(
          '/auth/login',
          description: 'Đăng nhập',
        );
}
