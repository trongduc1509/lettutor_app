import 'package:flutter/material.dart';
import 'package:lettutor_app/feature/courses/entities/course_item.dart';

import '../../base/theme/colors.dart';
import '../../gen/assets.gen.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({Key? key}) : super(key: key);

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/courses.png',
                    width: MediaQuery.of(context).size.width * 1 / 4,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Discover Courses',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: TextFormField(
                                  controller: _controller,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: const InputDecoration(
                                      hintText: 'Search courses',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 4.0,
                                        horizontal: 0,
                                      ),
                                      prefixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: AppColor().greyBorder),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: IconButton(
                                    icon: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Image.asset(
                                        Assets.images.filter.path,
                                        alignment: Alignment.center,
                                        //fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    onPressed: () {
                                      // EventManager().tempShopSelectedRetail?.add(
                                      //     EventManager().getShopCurrentRetailPM(3) ??
                                      //         const ShopsearchItem());
                                      // readBloc<ConfirmDatLeBloc>()
                                      //     .add(UpdateConfirmDatLeDrawer(
                                      //   isRequest: false,
                                      //   selectedState: state.status,
                                      //   startDate: state.startDate,
                                      //   endDate: state.endDate,
                                      //   selectedStateOrtherRetail:
                                      //       state.statusOtherRetail,
                                      //   selectedStateRequestType: const [],
                                      //   selectedStateMainWhs: const [],
                                      // ));
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.',
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 15.0,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) => const CourseItem(),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 8.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
