import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitState()) {
    on<HomeChangeTabEvent>(_onChangeTab);
    on<HomeUpdateDrawerEvent>(_updateDrawer);
    //add(const HomeChangeTabEvent(desTab: 0));
  }

  void _onChangeTab(HomeChangeTabEvent event, emit) {
    emit(
      HomeChangedTabState(
        currentTab: event.desTab,
      ),
    );
  }

  void _updateDrawer(HomeUpdateDrawerEvent event, emit) {
    emit(
      HomeUpdateEndDrawerState(
        searchTxt: event.searchTxt,
        tutorType: event.tutorType,
        filterSpecialities: event.filterSpecialities,
        filterSelectedSpecialities: event.filterSelectedSpecialities,
        availableTime: event.availableTime,
      ),
    );
  }
}
