import 'package:json_annotation/json_annotation.dart';

part 'book_class_usecase_params.g.dart';

@JsonSerializable(createFactory: false)
class BookClassUseCaseParams {
  const BookClassUseCaseParams({
    this.scheduleDetailIds = const [],
    this.note = '',
  });

  final List<String> scheduleDetailIds;
  final String note;

  Map<String, dynamic> toJson() => _$BookClassUseCaseParamsToJson(this);
}
