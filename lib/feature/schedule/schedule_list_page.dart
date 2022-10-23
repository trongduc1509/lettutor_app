import 'package:flutter/material.dart';
import 'package:lettutor_app/base/theme/colors.dart';
import 'package:lettutor_app/feature/schedule/entities/schedule_item.dart';

class ScheduleListPage extends StatelessWidget {
  const ScheduleListPage({Key? key}) : super(key: key);

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
              Image.asset(
                'assets/images/calendar.png',
                width: MediaQuery.of(context).size.width * 1 / 4,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Schedule',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColor().tertiary,
                    ),
                    child: const SizedBox(
                      width: 2.0,
                      height: 30.0,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Expanded(
                    child: Text(
                      "Here is a list of the sessions you have booked\nYou can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(10, (index) => const ScheduleItem()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
