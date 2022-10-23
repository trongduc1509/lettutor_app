import 'package:flutter/material.dart';
import 'package:lettutor_app/base/theme/colors.dart';
import 'package:lettutor_app/feature/history/entities/history_item.dart';

class HistoryListPage extends StatelessWidget {
  const HistoryListPage({Key? key}) : super(key: key);

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
                'assets/images/history.png',
                width: MediaQuery.of(context).size.width * 1 / 4,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'History',
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
                      "The following is a list of lessons you have attended\nYou can review the details of the lessons you have attended",
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
                children: List.generate(10, (index) => const HistoryItem()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
