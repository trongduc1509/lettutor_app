import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor_app/base/define/navigation/navigation.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/domain/entities/teacher_list_get_entity.dart';
import 'package:lettutor_app/feature/teachers/teachers_list/presentation/blocs/teachers_bloc/teachers_bloc.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/custom_shimmer.dart';
import '../../../widgets/teacher_tag.dart';
import '../../domain/entities/teacher_list_entity.dart';

class TeacherItem extends StatelessWidget {
  const TeacherItem({
    Key? key,
    required this.tutor,
    required this.tutorReview,
    this.isFav = false,
    this.searchTxt = "",
    this.perPage = 10,
    this.isVietnamese = false,
  }) : super(key: key);

  final TutorItemEntity tutor;
  final TutorItemGetEntity tutorReview;
  final bool isFav;
  final String searchTxt;
  final int perPage;
  final bool isVietnamese;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: GestureDetector(
        onTap: () async {
          await Navigator.of(context)
              .push(NavigationService.createTutorDetailRoute(
            tutor: tutorReview,
          ));
          context.read<TeachersBloc>().add(TeacherLoadEvent(
                searchTxt: searchTxt,
                perPage: perPage,
                isVietnamese: isVietnamese,
              ));
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            height: 80,
                            width: 80,
                            imageUrl: tutor.avatar ?? '',
                            placeholder: (context, url) =>
                                MyShimmer.shimmerBuilder(
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          Assets.images.blankAva.path))),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (tutor.name != null && tutor.name!.isNotEmpty)
                                Text(
                                  tutor.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              if (tutor.country != null &&
                                  tutor.country!.isNotEmpty)
                                Text(
                                  tutor.country!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              if (tutor.rating != null)
                                RatingBar.builder(
                                  ignoreGestures: true,
                                  allowHalfRating: true,
                                  direction: Axis.horizontal,
                                  initialRating: tutor.rating!,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemSize: 15,
                                  onRatingUpdate: (double value) {},
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      context.read<TeachersBloc>().add(TeacherFavUpdateEvent(
                            searchTxt: searchTxt,
                            tutorId: tutor.userId ?? '',
                            perPage: perPage,
                            isVietnamese: isVietnamese,
                          ));
                    },
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_outline,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              if (tutor.specialties != null && tutor.specialties!.isNotEmpty)
                Wrap(
                  // children: [
                  //   ...[
                  //     'All',
                  //     'English for kids',
                  //     'English for Business',
                  //     'Conversational',
                  //   ].map((e) => TeacherTag(title: e)),
                  // ],
                  children: [
                    ...tutor.specialties!.split(',').map(
                          (e) => TeacherTag(
                            title: e,
                          ),
                        ),
                  ],
                ),
              const SizedBox(
                height: 15.0,
              ),
              if (tutor.bio != null && tutor.bio!.isNotEmpty)
                Text(
                  tutor.bio!,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(
                height: 5.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Book'),
                  style: TextButton.styleFrom(
                      side: const BorderSide(color: Colors.blue)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
