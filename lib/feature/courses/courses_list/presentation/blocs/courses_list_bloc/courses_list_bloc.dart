import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/base/define/apigateway/exception/app_exception.dart';
import 'package:lettutor_app/feature/courses/courses_list/domain/entities/courses_list_entity.dart';
import 'package:lettutor_app/feature/courses/courses_list/domain/repositories/courses_list_repository.dart';
import 'package:lettutor_app/feature/courses/courses_list/domain/usecases/courses_list_usecase/courses_list.usecase.dart';
import 'package:lettutor_app/feature/courses/courses_list/domain/usecases/courses_list_usecase/courses_list_params.usecase.dart';

import '../../../../../../di/di_module.dart';

part 'courses_list_event.dart';
part 'courses_list_state.dart';

class CoursesListBloc extends Bloc<CoursesListEvent, CoursesListState> {
  CoursesListBloc() : super(const CoursesListInitState()) {
    on<CoursesListLoadEvent>(_onLoadCourses);
    add(
      const CoursesListLoadEvent(
        searchTxt: '',
      ),
    );
  }

  final CoursesListUseCase _getCoursesList =
      CoursesListUseCase(getIt.get<CoursesListRepository>());

  void _onLoadCourses(CoursesListLoadEvent event, emit) async {
    emit(const CoursesListLoadingState());
    final result = await _getCoursesList(CoursesListUseCaseParams(
      studentRequest: event.searchTxt,
      page: event.page,
      size: event.size,
    ));

    result.fold(
      (l) => emit(
        CoursesListLoadErrorState(
          exception: l,
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
