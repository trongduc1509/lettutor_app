import 'package:json_annotation/json_annotation.dart';

part 'get_upcoming_schedule_usecase_params.g.dart';

@JsonSerializable(createFactory: false)
class GetUpcomingScheduleUseCaseParams {
  const GetUpcomingScheduleUseCaseParams({
    this.page = 1,
    this.perPage = 6,
    this.orderBy = 'meeting',
    this.sortBy = 'desc',
    required this.dateTimeGte,
  });

  final int page;
  final int perPage;
  final int dateTimeGte;
  final String orderBy;
  final String sortBy;

  Map<String, dynamic> toJson() =>
      _$GetUpcomingScheduleUseCaseParamsToJson(this);
}
