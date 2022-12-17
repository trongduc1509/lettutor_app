import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/theme/colors.dart';
import '../../../../../gen/assets.gen.dart';
import '../blocs/courses_list_bloc/courses_list_bloc.dart';
import '../widgets/course_item.dart';

class CoursesListContent extends StatefulWidget {
  const CoursesListContent({Key? key}) : super(key: key);

  @override
  State<CoursesListContent> createState() => _CoursesListContentState();
}

class _CoursesListContentState extends State<CoursesListContent> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocListener<CoursesListBloc, CoursesListState>(
        listener: (context, state) {},
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      Assets.images.courses.path,
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
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
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
                                          width: 1,
                                          color: AppColor().greyBorder),
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
                Expanded(
                  child: BlocBuilder<CoursesListBloc, CoursesListState>(
                    builder: (context, state) {
                      if (state is CoursesListLoadDoneState) {
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 20,
                          itemBuilder: (context, index) => CourseItem(
                            courseItem: state.coursesList.data!.rows[index],
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 8.0,
                          ),
                        );
                      } else if (state is CoursesListLoadingState) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                      return const Center(
                        child: Text('Error while loading courses list...'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
