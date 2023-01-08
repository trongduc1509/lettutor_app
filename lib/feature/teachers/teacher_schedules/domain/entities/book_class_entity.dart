import 'package:equatable/equatable.dart';

class BookClassEntity extends Equatable {
  final int? statusCode;
  final String? message;

  const BookClassEntity({
    this.statusCode,
    this.message,
  });

  @override
  List<Object?> get props => [
        statusCode,
        message,
      ];
}
