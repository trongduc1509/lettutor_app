import 'package:flutter/material.dart';
import 'package:lettutor_app/feature/become_teacher/become_teacher_page.dart';
import 'package:lettutor_app/shared/widgets/date_picker.dart';

import '../../base/util/notifier.dart';
import '../../shared/widgets/common_txt.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final List<String> countryList = [
    'Việt Nam',
    'Hoa Kỳ',
    'Hàn Quốc',
    'Nhật Bản',
  ];
  DateTime dob = DateTime(2001, 01, 01);
  int countryIndexSelected = 0;

  @override
  void initState() {
    super.initState();
    _nameController.text = 'Long Long';
  }

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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/blank_ava.jpg'))),
                              )),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  iconSize: 20,
                                  padding: const EdgeInsets.all(0),
                                  constraints: const BoxConstraints(),
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      'Long Long',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      'Account ID: f569c202-7bbf-4620-af77-ecc1419a6b28',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      'Account Detail',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '* ',
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(color: Colors.red, fontSize: 15.0),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _nameController,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Account name',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Email Address',
                        style: DefaultTextStyle.of(context).style.copyWith(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'student@lettutor.com',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '* ',
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(color: Colors.red, fontSize: 15.0),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Country',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CommonTextField(
                      placeHolder: 'Country',
                      controller: _countryController
                        ..text = countryList[countryIndexSelected],
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 24,
                      ),
                      txtSelected: () {
                        Notifier.showCheckBottomSheet(
                          context,
                          title: 'Country',
                          ratioHeight: 0.5,
                          listData: countryList,
                          selectedIndex: countryIndexSelected,
                          onSelected: (index) {
                            setState(() {
                              countryIndexSelected = index;
                            });
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '* ',
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(color: Colors.red, fontSize: 15.0),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Phone Number',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText: '842499996508',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '* ',
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(color: Colors.red, fontSize: 15.0),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Birthday',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    DatePickerView(
                      date: dob,
                      active: true,
                      isTo: false,
                      title: 'Date of birth',
                      onDateChosen: (timeChosen) {
                        setState(() {
                          dob = timeChosen;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const BecomeTeacherPage(),
                                )),
                            child: const Text('Become a tutor')),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('Save changes')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
