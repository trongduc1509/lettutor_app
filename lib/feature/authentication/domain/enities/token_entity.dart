class TokenEntity {
  const TokenEntity({
    this.tokenDetail = '',
    this.expDate,
  });

  final String? tokenDetail;
  final DateTime? expDate;

  bool get valid => validDate && validToken;

  bool get validDate {
    if (expDate == null) return false;
    final now = DateTime.now();
    return expDate!.difference(now).inMilliseconds > 1000;
  }

  bool get validToken => tokenDetail!.isNotEmpty;
}
