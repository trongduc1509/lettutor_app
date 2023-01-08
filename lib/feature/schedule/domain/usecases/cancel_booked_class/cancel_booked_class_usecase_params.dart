import 'package:json_annotation/json_annotation.dart';

part 'cancel_booked_class_usecase_params.g.dart';

@JsonSerializable(createFactory: false)
class CancelBookingUseCaseParams {
  const CancelBookingUseCaseParams(
    this.scheduleDetailIds,
  );

  final List<String> scheduleDetailIds;

  Map<String, dynamic> toJson() => _$CancelBookingUseCaseParamsToJson(this);
}
