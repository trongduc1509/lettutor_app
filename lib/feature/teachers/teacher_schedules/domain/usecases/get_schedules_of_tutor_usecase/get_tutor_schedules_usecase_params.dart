import 'package:json_annotation/json_annotation.dart';

part 'get_tutor_schedules_usecase_params.g.dart';

@JsonSerializable(createFactory: false)
class GetTutorSchedulesUseCaseParams {
  final String tutorId;

  const GetTutorSchedulesUseCaseParams({
    required this.tutorId,
  });

  Map<String, dynamic> toJson() => _$GetTutorSchedulesUseCaseParamsToJson(this);
}
