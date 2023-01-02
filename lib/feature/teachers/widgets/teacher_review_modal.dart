import 'package:flutter/material.dart';
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
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: feedbacks.length,
        itemBuilder: (context, index) => TeacherReviewWidget(
          feedbackDetail: feedbacks[index],
        ),
      ),
    );
  }
}
