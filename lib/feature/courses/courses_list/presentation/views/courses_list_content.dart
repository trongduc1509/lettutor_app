import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/theme/colors.dart';
import '../../../../../gen/assets.gen.dart';
import '../blocs/courses_list_bloc/courses_list_bloc.dart';
import '../widgets/course_item.dart';

class CoursesListContent extends StatefulWidget {
  const CoursesListContent({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final CoursesListBloc bloc;

  @override
  State<CoursesListContent> createState() => _CoursesListContentState();
}

class _CoursesListContentState extends State<CoursesListContent> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        var isTop = _scrollController.position.pixels == 0;
        if (!isTop) {
          var state = widget.bloc.state;
          if (state is CoursesListLoadDoneState) {
            if (state.coursesList.data?.rows.isNotEmpty ?? false) {
              if (state.size <= (state.coursesList.data?.count ?? 0)) {
                widget.bloc.add(
                  CoursesListLoadEvent(
                    searchTxt: state.searchTxt,
                    size: state.size + 6,
                  ),
                );
              }
            }
          }
        }
      }
    });
  }

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
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 4.0,
                                        horizontal: 0,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    onChanged: (value) => widget.bloc.add(
                                      CoursesListLoadEvent(
                                        searchTxt: value,
                                      ),
                                    ),
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
                        // return ListView.separated(
                        //   physics: const BouncingScrollPhysics(),
                        //   itemCount: 20,
                        //   itemBuilder: (context, index) => CourseItem(
                        //     courseItem: state.coursesList.data!.rows[index],
                        //   ),
                        //   separatorBuilder: (BuildContext context, int index) =>
                        //       const SizedBox(
                        //     height: 8.0,
                        //   ),
                        // );
                        return RefreshIndicator(
                          onRefresh: () async {
                            await pullRefresh(
                              state,
                              _controller.text,
                            );
                          },
                          child: (state.coursesList.data?.rows.isNotEmpty ??
                                  false)
                              ? SingleChildScrollView(
                                  controller: _scrollController,
                                  child: Column(
                                    children: [
                                      if (state.coursesList.data != null)
                                        ...state.coursesList.data!.rows.map(
                                          (e) => Container(
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: CourseItem(
                                              courseItem: e,
                                            ),
                                          ),
                                        ),
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
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> pullRefresh(
      CoursesListLoadDoneState state, String content) async {
    widget.bloc.add(
      CoursesListLoadEvent(
        searchTxt: content,
      ),
    );
    FocusScope.of(context).unfocus();
  }
}
