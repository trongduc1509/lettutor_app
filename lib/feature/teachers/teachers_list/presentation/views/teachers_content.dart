import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/domain/entities/teacher_list_entity.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/presentation/widgets/teacher_item.dart';

import '../../../../../base/theme/colors.dart';
import '../../../../../gen/assets.gen.dart';
import '../blocs/teachers_bloc/teachers_bloc.dart';

class TeachersContent extends StatefulWidget {
  const TeachersContent({Key? key}) : super(key: key);

  @override
  State<TeachersContent> createState() => _TeachersContentState();
}

class _TeachersContentState extends State<TeachersContent> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _nationalController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocListener<TeachersBloc, TeachersState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
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
                  BlocBuilder<TeachersBloc, TeachersState>(
                    builder: (context, state) {
                      if (state is TeachersLoadDoneState) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.tutorsList.tutors?.rows?.length ?? 0,
                          itemBuilder: (context, index) {
                            var checkFav = state.tutorsList.isFav(
                                state.tutorsList.tutors?.rows?[index].id ?? '');
                            return TeacherItem(
                              tutor: state.tutorsList.tutors?.rows?[index] ??
                                  const TutorItemEntity(),
                              isFav: checkFav,
                            );
                          },
                        );
                      } else if (state is TeachersLoadingState) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                      return const Center(
                        child: Text(
                          'Error while loading tutors list...',
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
