import 'package:flutter/material.dart';

import '../../../base/theme/colors.dart';
import '../../../shared/widgets/expansion_panel.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor().greyBackground,
            borderRadius: BorderRadius.circular(4.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sun, 23 Oct 22',
                style: TextStyle(
                  color: AppColor().blackTitle,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                '49 minutes ago',
                style: TextStyle(
                  color: AppColor().blackTitle,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor().onSuccess,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                      ),
                    ),
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
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Text(
                            'France',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.message,
                                    color: Colors.blue,
                                    size: 12,
                                  ),
                                  Text('Direct Message')
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor().onSuccess,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lesson Time: 09:30 - 10:25',
                      style: TextStyle(
                        color: AppColor().blackTitle,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor().onSuccess,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor().dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const ExpandablePanel(
                      title: 'Request for lesson',
                      items: [
                        ExpandableModel(
                            title:
                                'Currently there are no requests for this class. Please write down any requests for the teacher.')
                      ]),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor().onSuccess,
                ),
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor().dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child:
                      const ExpandablePanel(title: 'Review from tutor', items: [
                    ExpandableModel(
                        title:
                            'Session 1: 09:30 - 09:55\nLesson Status: I was absent.'),
                  ]),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor().onSuccess,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(4.0),
                    bottomRight: Radius.circular(4.0),
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Add a rating'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Report'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Go to meeting'),
                ),
              )
            ],
          ),
        ));
  }
}
