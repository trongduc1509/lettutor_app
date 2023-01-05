import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/theme/colors.dart';
import '../../../../../base/util/notifier.dart';
import '../../../../../gen/assets.gen.dart';
import '../blocs/teachers_bloc/teachers_bloc.dart';
import '../widgets/teacher_item.dart';

class TeachersContent extends StatefulWidget {
  const TeachersContent({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final TeachersBloc bloc;

  @override
  State<TeachersContent> createState() => _TeachersContentState();
}

class _TeachersContentState extends State<TeachersContent> {
  final TextEditingController _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.position.atEdge) {
          var isTop = _scrollController.position.pixels == 0;
          if (!isTop) {
            var state = widget.bloc.state;
            if (state is TeachersLoadDoneState) {
              if (state.tutorsList.rows?.isNotEmpty ?? false) {
                if (state.perPage <= (state.tutorsList.count ?? 0)) {
                  widget.bloc.add(
                    TeacherLoadEvent(
                      searchTxt: state.searchTxt,
                      perPage: state.perPage + 10,
                      isVietnamese: state.isVietnamese,
                    ),
                  );
                }
              }
            }
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<TeachersBloc, TeachersState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'Find a tutor',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _searchController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Search tutor',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 0,
                          ),
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        onChanged: (value) =>
                            context.read<TeachersBloc>().add(TeacherLoadEvent(
                                  searchTxt: value,
                                )),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: AppColor().greyBorder),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: BlocBuilder<TeachersBloc, TeachersState>(
                            builder: (context, state) {
                              return IconButton(
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
                                  Notifier.showCheckBottomSheet(
                                    context,
                                    title: 'Country',
                                    ratioHeight: 0.5,
                                    listData: [
                                      'Vietnamese',
                                      'Foreigner',
                                    ],
                                    selectedIndex:
                                        (state is! TeachersLoadDoneState)
                                            ? null
                                            : state.isVietnamese
                                                ? 0
                                                : 1,
                                    onSelected: (index) {
                                      context
                                          .read<TeachersBloc>()
                                          .add(TeacherLoadEvent(
                                            searchTxt:
                                                _searchController.text.trim(),
                                            isVietnamese: index == 0,
                                            perPage: (state
                                                    is! TeachersLoadDoneState)
                                                ? 10
                                                : state.perPage,
                                          ));
                                    },
                                  );
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 10.0,
                // ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 1 / 2,
                //   child: CommonTextField(
                //     placeHolder: 'Tutor nationality',
                //     controller: _nationalController
                //       ..text = nationList[nationCurrentIndex],
                //     suffixIcon: Icon(
                //       Icons.keyboard_arrow_down_rounded,
                //       size: 24,
                //       color: AppColor().disable,
                //     ),
                //     txtSelected: () {
                //       Notifier.showCheckBottomSheet(
                //         context,
                //         title: 'Country',
                //         ratioHeight: 0.5,
                //         listData: nationList,
                //         selectedIndex: nationCurrentIndex,
                //         onSelected: (index) {
                //           setState(() {
                //             nationCurrentIndex = index;
                //           });
                //         },
                //       );
                //     },
                //   ),
                // ),
                // const SizedBox(
                //   height: 15.0,
                // ),
                // const Text(
                //   'Select available tutoring time:',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 15.0,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                // const SizedBox(
                //   height: 5.0,
                // ),
                // DatePickerView(
                //   date: availableDate,
                //   active: true,
                //   title: 'Select a day',
                //   onDateChosen: (chosenDate) {
                //     setState(() {
                //       availableDate = chosenDate;
                //     });
                //   },
                //   isTo: true,
                // ),
                // const SizedBox(
                //   height: 5.0,
                // ),
                // Wrap(
                //   children: [
                //     ...filterList.map((e) => Padding(
                //           padding: const EdgeInsets.symmetric(
                //             horizontal: 4.0,
                //           ),
                //           child: Chip(
                //             label: Text(e),
                //           ),
                //         )),
                //   ],
                // ),
                // TextButton(
                //   onPressed: () {},
                //   child: const Text('Reset Filters'),
                //   style: TextButton.styleFrom(
                //       side: const BorderSide(color: Colors.blue)),
                // ),
                const SizedBox(
                  height: 15.0,
                ),
                DecoratedBox(
                  decoration:
                      BoxDecoration(color: Theme.of(context).dividerColor),
                  child: const SizedBox(
                    height: 1.5,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                // const Text(
                //   'Recommended Tutors',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 28,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                // const SizedBox(
                //   height: 5.0,
                // ),
                Expanded(
                  child: BlocBuilder<TeachersBloc, TeachersState>(
                    builder: (context, state) {
                      if (state is TeachersLoadDoneState) {
                        return RefreshIndicator(
                          onRefresh: () async {
                            await pullRefresh(
                              state,
                              _searchController.text,
                            );
                          },
                          child: (state.tutorsList.rows?.isNotEmpty ?? false)
                              ? SingleChildScrollView(
                                  controller: _scrollController,
                                  child: Column(
                                    children: [
                                      if (state.tutorsList.rows != null)
                                        ...state.tutorsList.rows!.map((e) =>
                                            TeacherItem(
                                              tutor: e,
                                              tutorReview: state
                                                  .tutorsReviewsList
                                                  .getTutorById(e.id ?? ''),
                                              isFav: e.isfavoritetutor == "1",
                                              searchTxt: state.searchTxt,
                                              perPage: state.perPage,
                                              isVietnamese: state.isVietnamese,
                                            )),
                                      // ListView.builder(
                                      //   shrinkWrap: true,
                                      //   physics:
                                      //       const NeverScrollableScrollPhysics(),
                                      //   itemCount:
                                      //       state.tutorsList.rows?.length ?? 0,
                                      //   itemBuilder: (context, index) =>
                                      //       TeacherItem(
                                      //     tutor:
                                      //         state.tutorsList.rows?[index] ??
                                      //             const TutorItemEntity(),
                                      //     tutorReview: state.tutorsReviewsList
                                      //         .getTutorById(state.tutorsList
                                      //                 .rows?[index].id ??
                                      //             ''),
                                      //     isFav: state.tutorsList.rows?[index]
                                      //             .isfavoritetutor ==
                                      //         "1",
                                      //     searchTxt: state.searchTxt,
                                      //     perPage: state.perPage,
                                      //     isVietnamese: state.isVietnamese,
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 40.0,
                                        child: state.showLoading
                                            ? const CupertinoActivityIndicator()
                                            : null,
                                      )
                                    ],
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    state.searchTxt != ''
                                        ? 'Chưa tìm thấy kết quả bạn cần rồi.\nHãy thử lại nhé!'
                                        : 'Không có dữ liệu',
                                  ),
                                ),
                        );
                      }
                      return Center(
                        child: Column(
                          children: const [
                            Text(
                              'Đang tải dữ liệu.\nVui lòng chờ...',
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            CupertinoActivityIndicator(),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Future<void> pullRefresh(TeachersLoadDoneState state, String content) async {
    widget.bloc.add(
      TeacherLoadEvent(
        searchTxt: content,
        isVietnamese: state.isVietnamese,
      ),
    );
    FocusScope.of(context).unfocus();
  }
}
