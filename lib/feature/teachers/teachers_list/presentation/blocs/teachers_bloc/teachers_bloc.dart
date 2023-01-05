import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/domain/usecases/manage_fav_teacher_usecase/manage_fav_teacher_params.usecase.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/entities/teacher_list_entity.dart';
import '../../../domain/entities/teacher_list_get_entity.dart';
import '../../../domain/repositories/teachers_repository.dart';
import '../../../domain/usecases/manage_fav_teacher_usecase/manage_fav_teacher.usecase.dart';
import '../../../domain/usecases/teacher_list_search_usecase/teacher_list_search.usecase.dart';
import '../../../domain/usecases/teacher_list_search_usecase/teacher_list_search_params.usecase.dart';
import '../../../domain/usecases/teacher_list_usecase/teacher_list.usecase.dart';
import '../../../domain/usecases/teacher_list_usecase/teacher_list_params.usecase.dart';

part 'teachers_event.dart';
part 'teachers_state.dart';

class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  TeachersBloc() : super(const TeachersInitState()) {
    on<TeacherLoadEvent>(_onLoadTeachers);
    on<TeacherFavUpdateEvent>(_onManageFavTutor);
  }

  final TeacherListUseCase _getTeachersList =
      TeacherListUseCase(getIt.get<TeacherListRepository>());
  final TeacherListSearchUseCase _searchTeachersList =
      TeacherListSearchUseCase(getIt.get<TeacherListRepository>());
  final ManageFavTeacherUseCase _manageFavTeacherUseCase =
      ManageFavTeacherUseCase(getIt.get<TeacherListRepository>());

  void _onLoadTeachers(TeacherLoadEvent event, emit) async {
    //emit(const TeachersLoadingState());
    final resultSearch =
        await _searchTeachersList(TeacherListSearchUseCaseParams(
      isVietnamese: event.isVietnamese,
      searchTxt: event.searchTxt,
      perPage: event.perPage,
    ));

    await resultSearch.fold(
      (l) => emit(
        TeachersLoadErrorState(
          exception: l,
          searchTxt: event.searchTxt,
          isVietnamese: event.isVietnamese,
        ),
      ),
      (r) async {
        final resultReview = await _getTeachersList(TeacherListUseCaseParams(
          studentRequest: event.searchTxt,
          page: 1,
          perPage: 1000,
        ));

        resultReview.fold(
          (left) => emit(
            TeachersLoadDoneState(
              tutorsReviewsList: const TeacherTotalGetEntity(),
              tutorsList: r,
              searchTxt: event.searchTxt,
              page: event.page,
              perPage: event.perPage,
              isVietnamese: event.isVietnamese,
            ),
          ),
          (right) => emit(
            TeachersLoadDoneState(
              tutorsReviewsList: right,
              tutorsList: r,
              searchTxt: event.searchTxt,
              page: event.page,
              perPage: event.perPage,
              isVietnamese: event.isVietnamese,
            ),
          ),
        );
      },
    );
  }

  void _onManageFavTutor(TeacherFavUpdateEvent event, emit) async {
    await _manageFavTeacherUseCase(ManageFavTeacherUseCaseParams(
      tutorId: event.tutorId,
    ));

    add(TeacherLoadEvent(
      searchTxt: event.searchTxt,
      perPage: event.perPage,
      isVietnamese: event.isVietnamese,
    ));
  }
}
