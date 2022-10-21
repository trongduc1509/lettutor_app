import 'package:flutter/material.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({Key? key}) : super(key: key);

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  final List<String> topics = [
    'The Internet',
    'Artificial Intelligence (AI)',
    'Social Media',
    'Internet Privacy',
    'Live Streaming',
    'Coding',
    'Technology Transforming Healthcare',
    'Smart Home Technology',
    'Remote Work - A Dream Job?',
  ];

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
            vertical: 10.0,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: Image.asset('assets/images/temp_course_item.png'),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Life in the Internet Age',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "Let's discuss how technology is changing the way we live",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                    ),
                    child: const SizedBox(
                      height: 1.5,
                      width: 15.0,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    'Overview',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor,
                      ),
                      child: const SizedBox(
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.question_mark_rounded,
                    size: 15.0,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Why take this course',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24.0,
                ),
                child: Text(
                  'Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.question_mark_rounded,
                    size: 15.0,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'What will you be able to do',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24.0,
                ),
                child: Text(
                  'You will learn vocabulary related to timely topics like remote work, artificial intelligence, online privacy, and more. In addition to discussion questions, you will practice intermediate level speaking tasks such as using data to describe trends.',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                    ),
                    child: const SizedBox(
                      height: 1.5,
                      width: 15.0,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    'Experience Level',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor,
                      ),
                      child: const SizedBox(
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.person_add_alt,
                    size: 15.0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Intermediate',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                    ),
                    child: const SizedBox(
                      height: 1.5,
                      width: 15.0,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    'Course Length',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor,
                      ),
                      child: const SizedBox(
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.topic,
                    size: 15.0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '9 topics',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                    ),
                    child: const SizedBox(
                      height: 1.5,
                      width: 15.0,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    'List Topics',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor,
                      ),
                      child: const SizedBox(
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text('${index + 1}. ${topics[index]}'),
                ),
                itemCount: topics.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
