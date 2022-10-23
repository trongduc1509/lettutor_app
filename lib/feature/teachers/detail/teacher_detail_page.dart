import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor_app/base/define/style/default_style.dart';
import 'package:lettutor_app/base/theme/colors.dart';
import 'package:lettutor_app/feature/courses/detail/course_detail_page.dart';
import 'package:lettutor_app/feature/teachers/widgets/teacher_tag.dart';

import '../../../shared/widgets/date_picker.dart';

class TeacherDetailPage extends StatefulWidget {
  const TeacherDetailPage({Key? key}) : super(key: key);

  @override
  State<TeacherDetailPage> createState() => _TeacherDetailPageState();
}

class _TeacherDetailPageState extends State<TeacherDetailPage> {
  DateTime? bookedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blue,
            )),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/blank_ava.jpg'))),
                      )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Keeganfhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        RatingBar.builder(
                          ignoreGestures: true,
                          allowHalfRating: true,
                          direction: Axis.horizontal,
                          initialRating: 4.5,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemSize: 15,
                          onRatingUpdate: (double value) {},
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'France',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.',
                style: TextStyle(fontSize: 15.0),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.favorite_border,
                          color: Colors.blue,
                          size: 24.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Favorite',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.report_outlined,
                          color: Colors.blue,
                          size: 24.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Report',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.star_border,
                          color: Colors.blue,
                          size: 24.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Reviews',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor().greyBackground,
                ),
                child: const Center(
                  child: Text('Introduction Video'),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Languages',
                style: DefaultStyle().t20Medium,
              ),
              Wrap(
                children: const [
                  TeacherTag(title: 'English'),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Specialties',
                style: DefaultStyle().t20Medium,
              ),
              Wrap(
                children: [
                  ...[
                    'All',
                    'English for kids',
                    'English for Business',
                    'Conversational',
                  ].map((e) => TeacherTag(title: e)),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Suggested courses',
                style: DefaultStyle().t20Medium,
              ),
              const SizedBox(
                height: 5.0,
              ),
              ListView(
                shrinkWrap: true,
                children: List.generate(
                    2,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 8.0,
                          ),
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CourseDetailPage(),
                            )),
                            behavior: HitTestBehavior.opaque,
                            child: Text(
                              'Life in the Internet Age',
                              style: DefaultStyle().t16Medium.copyWith(
                                    color: AppColor().blueLightTxt,
                                  ),
                            ),
                          ),
                        )),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Interests',
                style: DefaultStyle().t20Medium,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Text(
                  'I loved the weather, the scenery and the laid-back lifestyle of the locals.',
                  style: DefaultStyle().t14Regular,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Teaching Experience',
                style: DefaultStyle().t20Medium,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Text(
                  'I have more than 10 years of teaching english experience',
                  style: DefaultStyle().t14Regular,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Booking Section',
                style: DefaultStyle().t20Medium,
              ),
              const SizedBox(
                height: 10.0,
              ),
              DatePickerView(
                date: bookedDate,
                active: true,
                title: 'Select a day',
                onDateChosen: (chosenDate) {
                  setState(() {
                    bookedDate = chosenDate;
                  });
                },
                isTo: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
