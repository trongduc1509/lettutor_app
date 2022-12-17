import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/entities/course_detail_entity.dart';
import '../../../domain/repositories/course_detail_repository.dart';
import '../../../domain/usecases/course_detail.usecase.dart';

part 'course_detail_event.dart';
part 'course_detail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(const CourseDetailInitState()) {
    on<CourseDetailLoadEvent>(_onLoadDetail);
  }

  final CourseDetailUseCase _getDetailUseCase =
      CourseDetailUseCase(getIt.get<CourseDetailRepository>());

  void _onLoadDetail(CourseDetailLoadEvent event, emit) async {
    emit(const CourseDetailLoadingState());
    final result = await _getDetailUseCase(event.courseId);

    result.fold(
      (l) => emit(
        CourseDetailLoadErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        CourseDetailLoadDoneState(
          data: r,
        ),
      ),
    );
  }
}
