import 'package:flutter/material.dart';
import 'package:lettutor_app/feature/courses/courses_list.dart';
import 'package:lettutor_app/feature/history/history_list_page.dart';
import 'package:lettutor_app/feature/profile/profile_page.dart';
import 'package:lettutor_app/feature/schedule/schedule_list_page.dart';

import '../teachers/teachers_list/teachers_list_page.dart';

final GlobalKey<ScaffoldState> keyDrawerHomePage = GlobalKey();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.index = 0;
    _currentIndex = 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset(
            'assets/images/lettutor_logo.png',
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
          HistoryListPage(),
          CoursesList(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (_index) {
            setState(() {
              _currentIndex = _index;
            });
            _tabController.animateTo(_currentIndex);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Tutors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
