import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/domain/usecases/manage_fav_teacher_usecase/manage_fav_teacher_params.usecase.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../../teachers_list/domain/repositories/teachers_repository.dart';
import '../../../../teachers_list/domain/usecases/manage_fav_teacher_usecase/manage_fav_teacher.usecase.dart';
import '../../../domain/entities/teacher_detail_entity.dart';
import '../../../domain/repositories/teacher_detail_repository.dart';
import '../../../domain/usecases/teacher_detail.usecase.dart';

part 'teacher_detail_event.dart';
part 'teacher_detail_state.dart';

class TeacherDetailBloc extends Bloc<TeacherDetailEvent, TeacherDetailState> {
  TeacherDetailBloc() : super(const TeacherDetailInitState()) {
    on<TeacherDetailLoadEvent>(_onLoad);
    on<TeacherUpdateFavEvent>(_onManageFavTeacher);
  }

  final TeacherDetailUseCase _teacherDetailUseCase =
      TeacherDetailUseCase(getIt.get<TeacherDetailRepository>());
  final ManageFavTeacherUseCase _manageFavTeacherUseCase =
      ManageFavTeacherUseCase(getIt.get<TeacherListRepository>());

  void _onLoad(TeacherDetailLoadEvent event, emit) async {
    emit(const TeacherDetailLoadingState());
    final result = await _teacherDetailUseCase(event.teacherId);

    result.fold(
      (l) => emit(
        TeacherDetailLoadErrorState(
          exception: l,
        ),
      ),
      (r) => emit(
        TeacherDetailLoadDoneState(
          data: r,
        ),
      ),
    );
  }

  void _onManageFavTeacher(TeacherUpdateFavEvent event, emit) async {
    await _manageFavTeacherUseCase.execute(ManageFavTeacherUseCaseParams(
      tutorId: event.teacherId,
    ));

    add(TeacherDetailLoadEvent(
      teacherId: event.teacherId,
    ));
  }
}
