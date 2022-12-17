import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/feature/courses/courses_list/domain/entities/courses_list_entity.dart';
import 'package:lettutor_app/feature/courses/detail/course_detail_page.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/custom_shimmer.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({
    Key? key,
    required this.courseItem,
  }) : super(key: key);

  final CourseEntity courseItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CourseDetailPage())),
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: courseItem.imageUrl ?? '',
              height: 100,
              placeholder: (context, url) => MyShimmer.shimmerBuilder(
                child: Container(
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      Assets.images.tempCourseItem.path,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseItem.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      courseItem.description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                        'Level ${courseItem.level} • ${courseItem.topics.length} Topics'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
