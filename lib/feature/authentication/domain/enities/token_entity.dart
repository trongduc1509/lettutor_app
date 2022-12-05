import 'package:lettutor_app/base/extension/time.dart';

class TokenEntity {
  const TokenEntity({
    this.tokenDetail = '',
    this.expDate,
  });

  final String? tokenDetail;
  final DateTime? expDate;
}
