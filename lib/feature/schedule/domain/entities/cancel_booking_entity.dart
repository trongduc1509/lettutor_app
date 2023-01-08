import 'package:equatable/equatable.dart';

class CancelBookingEntity extends Equatable {
  final String? message;

  const CancelBookingEntity({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
