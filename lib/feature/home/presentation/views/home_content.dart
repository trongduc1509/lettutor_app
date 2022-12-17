import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/base/theme/colors.dart';
import 'package:lettutor_app/feature/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:lettutor_app/gen/assets.gen.dart';

import '../../../../shared/widgets/bottom_bar.dart';
import '../../../courses/courses_list/presentation/views/courses_list_page.dart';
import '../../../history/presentation/views/history_page.dart';
import '../../../profile/presentation/views/profile_page.dart';
import '../../../schedule/presentation/views/schedule_list_page.dart';
import '../../../teachers/teachers_list/teachers_list_page.dart';

final GlobalKey<ScaffoldState> _keyDrawerHome = GlobalKey();

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 5,
      initialIndex: 0,
      vsync: this,
      animationDuration: Duration.zero,
    );
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeUpdateEndDrawerState) {
            _keyDrawerHome.currentState?.openEndDrawer();
          }
        },
        listenWhen: (p, c) => p != c,
        child: Scaffold(
          key: _keyDrawerHome,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Assets.images.lettutorLogo.path,
                    height: 24.0,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.language,
                        size: 24.0,
                        color: Theme.of(context).primaryColor,
                      )),
                ]),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: const [
              TeachersListPage(),
              ScheduleListPage(),
              HistoryPage(),
              CoursesListPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomIndicatorBar(
            currentIndex: _tabController.index,
            width: MediaQuery.of(context).size.width,
            onTap: (_index) {
              _tabController.index = _index;
            },
            items: [
              BottomIndicatorNavigationBarItem(
                availableIcon: Icons.school,
                title: 'Tutors',
              ),
              BottomIndicatorNavigationBarItem(
                availableIcon: Icons.calendar_month,
                title: 'Schedule',
              ),
              BottomIndicatorNavigationBarItem(
                availableIcon: Icons.history,
                title: 'History',
              ),
              BottomIndicatorNavigationBarItem(
                availableIcon: Icons.book,
                title: 'Courses',
              ),
              BottomIndicatorNavigationBarItem(
                availableIcon: Icons.person,
                title: 'Profile',
              ),
            ],
            activeColor: AppColor().primary,
            inactiveColor: AppColor().greySecondary,
          ),
        ),
      );
}
