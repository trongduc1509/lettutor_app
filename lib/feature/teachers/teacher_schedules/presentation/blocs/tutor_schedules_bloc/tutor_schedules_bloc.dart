import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/apigateway/exception/app_exception.dart';
import '../../../../../../base/extension/iterable.dart';
import '../../../../../../base/extension/time.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/entities/schedules_entity.dart';
import '../../../domain/repositories/teacher_schedules_repository.dart';
import '../../../domain/usecases/get_schedules_of_tutor_usecase/get_tutor_schedules_usecase.dart';
import '../../../domain/usecases/get_schedules_of_tutor_usecase/get_tutor_schedules_usecase_params.dart';

part 'tutor_schedules_event.dart';
part 'tutor_schedules_state.dart';

class TutorSchedulesBloc
    extends Bloc<TutorSchedulesEvent, TutorSchedulesState> {
  TutorSchedulesBloc() : super(const TutorSchedulesInitState()) {
    on<TutorSchedulesLoadEvent>(_onLoadSchedules);
  }

  final GetTutorSchedulesUseCase getTutorSchedulesUseCase =
      GetTutorSchedulesUseCase(
    teacherSchedulesRepository: getIt.get<TeacherSchedulesRepository>(),
  );

  void _onLoadSchedules(TutorSchedulesLoadEvent event, emit) async {
    final result = await getTutorSchedulesUseCase.execute(
      GetTutorSchedulesUseCaseParams(
        tutorId: event.tutorId,
      ),
    );

    result.fold(
      (l) => emit(
        TutorSchedulesLoadErrorState(exception: l),
      ),
      (r) {
        var list = <ScheduleEntity>[];
        list = r.data != null ? r.data! : [];
        list.sort(
            (a, b) => (b.startTimestamp ?? 0).compareTo(a.startTimestamp ?? 0));
        var newMap = list
            .map((e) => {
                  'id': e.id,
                  'scheduleDate':
                      DateTime.fromMillisecondsSinceEpoch(e.startTimestamp ?? 0)
                          .convertDate('dd/MM/yyyy'),
                })
            .toList();
        var separatedList = newMap.groupBy((obj) => obj['scheduleDate']);
        var sortMap = <String, String>{};
        for (var item in separatedList.keys) {
          var data = separatedList[item ?? ''];
          var id = data?.first['id'];
          sortMap[item ?? ''] = id ?? '';
        }

        return emit(
          TutorSchedulesLoadDoneState(
            schedules: list,
            separatedList: sortMap,
          ),
        );
      },
    );
  }
}
