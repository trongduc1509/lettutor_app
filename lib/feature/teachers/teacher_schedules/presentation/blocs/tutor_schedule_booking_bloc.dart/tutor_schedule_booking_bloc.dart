import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/repositories/book_class_repository.dart';
import '../../../domain/usecases/book_class_usecase/book_class_usecase.dart';
import '../../../domain/usecases/book_class_usecase/book_class_usecase_params.dart';

part 'tutor_schedule_booking_event.dart';
part 'tutor_schedule_booking_state.dart';

class TutorScheduleBookingBloc
    extends Bloc<TutorScheduleBookingEvent, TutorScheduleBookingState> {
  TutorScheduleBookingBloc() : super(const TutorScheduleBookingInitState()) {
    on<TutorScheduleBookEvent>(_onBookClass);
  }

  final BookClassUseCase _bookClass = BookClassUseCase(
    bookClassRepository: getIt.get<BookClassRepository>(),
  );

  void _onBookClass(TutorScheduleBookEvent event, emit) async {
    print(BookClassUseCaseParams(
      scheduleDetailIds: [event.scheduleDetailId],
    ).toJson());
    final result = await _bookClass(
      BookClassUseCaseParams(
        scheduleDetailIds: [event.scheduleDetailId],
      ),
    );

    result.fold(
      (l) => emit(
        TutorScheduleBookingErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        const TutorScheduleBookingDoneState(),
      ),
    );
  }
}
