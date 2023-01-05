import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/entities/courses_list_entity.dart';
import '../../../domain/repositories/courses_list_repository.dart';
import '../../../domain/usecases/courses_list_usecase/courses_list.usecase.dart';
import '../../../domain/usecases/courses_list_usecase/courses_list_params.usecase.dart';

part 'courses_list_event.dart';
part 'courses_list_state.dart';

class CoursesListBloc extends Bloc<CoursesListEvent, CoursesListState> {
  CoursesListBloc() : super(const CoursesListInitState()) {
    on<CoursesListLoadEvent>(_onLoadCourses);
  }

  final CoursesListUseCase _getCoursesList =
      CoursesListUseCase(getIt.get<CoursesListRepository>());

  void _onLoadCourses(CoursesListLoadEvent event, emit) async {
    // emit(const CoursesListLoadingState());
    final result = await _getCoursesList(CoursesListUseCaseParams(
      studentRequest: event.searchTxt,
      page: event.page,
      size: event.size,
    ));

    result.fold(
      (l) => emit(
        CoursesListLoadErrorState(
          exception: l,
          searchTxt: event.searchTxt,
          page: event.page,
          size: event.size,
        ),
      ),
      (r) => emit(
        CoursesListLoadDoneState(
          coursesList: r,
          searchTxt: event.searchTxt,
          page: event.page,
          size: event.size,
        ),
      ),
    );
  }
}
