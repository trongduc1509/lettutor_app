import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/cancel_booking_entity.dart';

part 'cancel_booking_model.g.dart';

@JsonSerializable(createToJson: false)
class CancelBookingModel extends CancelBookingEntity {
  final String? message;

  const CancelBookingModel({
    this.message,
  });

  static CancelBookingModel fromJson(Map<String, dynamic> json) =>
      _$CancelBookingModelFromJson(json);
}
