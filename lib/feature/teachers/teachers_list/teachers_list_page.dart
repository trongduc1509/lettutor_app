import 'package:flutter/material.dart';
import 'package:lettutor_app/base/theme/colors.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/presentation/widgets/teacher_item.dart';
import 'package:lettutor_app/shared/widgets/common_txt.dart';
import 'package:lettutor_app/shared/widgets/date_picker.dart';

import '../../../base/util/notifier.dart';
import '../../../gen/assets.gen.dart';

class TeachersListPage extends StatefulWidget {
  const TeachersListPage({Key? key}) : super(key: key);

  @override
  State<TeachersListPage> createState() => _TeachersListPageState();
}

class _TeachersListPageState extends State<TeachersListPage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _nationalController = TextEditingController();
  final List<String> nationList = [
    'Foreign Tutor',
    'Vietnamese Tutor',
    'Native English Tutor',
  ];
  final List<String> filterList = [
    'All',
    'English for kids',
    'English for Business',
    'Conversational',
    'STARTERS',
    'MOVERS',
    'FLYERS',
    'KET',
    'PET',
    'IELTS',
    'TOEFL',
    'TOEIC',
  ];
  int nationCurrentIndex = 0;
  DateTime? availableDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              ))),
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
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 1 / 2,
                child: CommonTextField(
                  placeHolder: 'Tutor nationality',
                  controller: _nationalController
                    ..text = nationList[nationCurrentIndex],
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 24,
                    color: AppColor().disable,
                  ),
                  txtSelected: () {
                    Notifier.showCheckBottomSheet(
                      context,
                      title: 'Country',
                      ratioHeight: 0.5,
                      listData: nationList,
                      selectedIndex: nationCurrentIndex,
                      onSelected: (index) {
                        setState(() {
                          nationCurrentIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Select available tutoring time:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              DatePickerView(
                date: availableDate,
                active: true,
                title: 'Select a day',
                onDateChosen: (chosenDate) {
                  setState(() {
                    availableDate = chosenDate;
                  });
                },
                isTo: true,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Wrap(
                children: [
                  ...filterList.map((e) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                        ),
                        child: Chip(
                          label: Text(e),
                        ),
                      )),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Reset Filters'),
                style: TextButton.styleFrom(
                    side: const BorderSide(color: Colors.blue)),
              ),
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
              const Text(
                'Recommended Tutors',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              // ListView(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   children: List.generate(10, (index) => const TeacherItem()),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
