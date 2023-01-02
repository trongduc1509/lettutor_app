import 'package:json_annotation/json_annotation.dart';
import '../../../../../base/extension/time.dart';

part 'update_info_params.usecase.g.dart';

@JsonSerializable(createFactory: false)
class UpdateInfoUseCaseParams {
  const UpdateInfoUseCaseParams({
    required this.name,
    required this.country,
    required this.phone,
    required this.birthday,
    required this.level,
    this.learnTopics = const [],
    this.testPreparations = const [],
  });

  final String name;
  final String country;
  final String phone;
  @JsonKey(toJson: timeToJsonWithoutTime)
  final DateTime birthday;
  final String level;
  final List<String> learnTopics;
  final List<String> testPreparations;

  Map<String, dynamic> toJson() => _$UpdateInfoUseCaseParamsToJson(this);
}
