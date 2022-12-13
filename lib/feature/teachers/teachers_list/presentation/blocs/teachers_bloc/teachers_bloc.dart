import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/domain/usecases/teacher_list_usecase/teacher_list_params.usecase.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/entities/teacher_list_entity.dart';
import '../../../domain/repositories/teachers_repository.dart';
import '../../../domain/usecases/teacher_list_usecase/teacher_list.usecase.dart';

part 'teachers_event.dart';
part 'teachers_state.dart';

class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  TeachersBloc() : super(const TeachersInitState()) {
    on<TeacherLoadEvent>(_onLoadTeachers);
    add(
      const TeacherLoadEvent(
        searchTxt: '',
      ),
    );
  }

  final TeacherListUseCase _getTeachersList =
      TeacherListUseCase(getIt.get<TeacherListRepository>());

  void _onLoadTeachers(TeacherLoadEvent event, emit) async {
    emit(const TeachersLoadingState());
    final result = await _getTeachersList(TeacherListUseCaseParams(
      studentRequest: event.searchTxt,
      page: event.page,
      perPage: event.perPage,
    ));

    result.fold(
      (l) => emit(
        TeachersLoadErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        TeachersLoadDoneState(
          tutorsList: r,
          searchTxt: event.searchTxt,
          page: event.page,
          perPage: event.perPage,
        ),
      ),
    );
  }
}
