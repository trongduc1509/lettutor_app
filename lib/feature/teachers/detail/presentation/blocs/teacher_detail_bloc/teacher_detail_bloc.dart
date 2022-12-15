import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/entities/teacher_detail_entity.dart';
import '../../../domain/repositories/teacher_detail_repository.dart';
import '../../../domain/usecases/teacher_detail.usecase.dart';

part 'teacher_detail_event.dart';
part 'teacher_detail_state.dart';

class TeacherDetailBloc extends Bloc<TeacherDetailEvent, TeacherDetailState> {
  TeacherDetailBloc() : super(const TeacherDetailInitState()) {
    on<TeacherDetailLoadEvent>(_onLoad);
  }

  final TeacherDetailUseCase _teacherDetailUseCase =
      TeacherDetailUseCase(getIt.get<TeacherDetailRepository>());

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
}
