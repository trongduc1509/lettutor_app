import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor_app/base/define/style/default_style.dart';

import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/custom_shimmer.dart';
import '../teachers_list/domain/entities/teacher_list_get_entity.dart';

class TeacherReviewWidget extends StatelessWidget {
  const TeacherReviewWidget({
    Key? key,
    required this.feedbackDetail,
  }) : super(key: key);

  final TutorItemFeedbackEntity feedbackDetail;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                height: 30,
                width: 30,
                imageUrl: feedbackDetail.firstInfo?.avatar ?? '',
                placeholder: (context, url) => MyShimmer.shimmerBuilder(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Assets.images.blankAva.path))),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${feedbackDetail.firstInfo?.name ?? ''} - ${feedbackDetail.getUpdatedAt(containTime: true)}',
                  style: DefaultStyle().t12Medium.copyWith(
                        color: Colors.black.withOpacity(0.45),
                      ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                if (feedbackDetail.rating != null) ...[
                  RatingBar.builder(
                    ignoreGestures: true,
                    allowHalfRating: true,
                    direction: Axis.horizontal,
                    initialRating: feedbackDetail.rating!.toDouble(),
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemSize: 10,
                    onRatingUpdate: (double value) {},
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
                Text(
                  feedbackDetail.content ?? '',
                  style: DefaultStyle().t12Medium.copyWith(
                        color: Colors.black.withOpacity(0.45),
                      ),
                ),
              ],
            )
          ],
        ),
      );
}
