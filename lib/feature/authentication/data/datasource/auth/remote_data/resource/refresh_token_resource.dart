import '../../../../../../../base/define/resource/resource.base.dart';

class RefreshTokenResource extends Resource {
  const RefreshTokenResource()
      : super('/auth/refresh-token', description: 'Refresh token');
}
