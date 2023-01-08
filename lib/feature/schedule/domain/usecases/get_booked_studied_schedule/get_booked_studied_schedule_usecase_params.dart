import 'package:json_annotation/json_annotation.dart';

part 'get_booked_studied_schedule_usecase_params.g.dart';

@JsonSerializable(createFactory: false)
class GetBookedStudiedScheduleUseCaseParams {
  const GetBookedStudiedScheduleUseCaseParams({
    this.page = 1,
    this.perPage = 6,
    this.orderBy = 'meeting',
    this.sortBy = 'desc',
    required this.dateTimeLte,
  });

  final int page;
  final int perPage;
  final int dateTimeLte;
  final String orderBy;
  final String sortBy;

  Map<String, dynamic> toJson() =>
      _$GetBookedStudiedScheduleUseCaseParamsToJson(this);
}
