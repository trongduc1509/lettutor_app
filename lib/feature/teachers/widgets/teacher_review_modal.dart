import 'package:flutter/material.dart';
import '../../../base/define/style/default_style.dart';
import '../teachers_list/domain/entities/teacher_list_get_entity.dart';
import 'teacher_review.dart';

class TeacherReviewsModal extends StatelessWidget {
  const TeacherReviewsModal({
    Key? key,
    this.feedbacks = const [],
  }) : super(key: key);

  final List<TutorItemFeedbackEntity> feedbacks;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
              Text(
                'Reviews',
                style: DefaultStyle().t14Medium,
              ),
            ],
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: feedbacks.length,
              itemBuilder: (context, index) => TeacherReviewWidget(
                feedbackDetail: feedbacks[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
