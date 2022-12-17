import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../base/define/navigation/navigation.dart';
import '../../../../../base/define/style/default_style.dart';
import '../../../../../base/theme/colors.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/custom_shimmer.dart';
import '../../../teachers_list/domain/entities/teacher_list_entity.dart';
import '../../../widgets/teacher_review_modal.dart';
import '../../../widgets/teacher_tag.dart';
import '../blocs/teacher_detail_bloc/teacher_detail_bloc.dart';

class TeacherDetailContent extends StatefulWidget {
  const TeacherDetailContent({
    Key? key,
    this.dataFromList,
  }) : super(key: key);

  final TutorItemEntity? dataFromList;

  @override
  State<TeacherDetailContent> createState() => _TeacherDetailContentState();
}

class _TeacherDetailContentState extends State<TeacherDetailContent> {
  DateTime? bookedDate;

  @override
  Widget build(BuildContext context) =>
      BlocListener<TeacherDetailBloc, TeacherDetailState>(
        listener: (context, state) {},
        child: Scaffold(
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
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
          body: BlocBuilder<TeacherDetailBloc, TeacherDetailState>(
            builder: (context, state) {
              if (state is TeacherDetailLoadDoneState) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                              child: CachedNetworkImage(
                                height: 80,
                                width: 80,
                                imageUrl: state.data.user?.avatar ?? '',
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
                                  Text(
                                    state.data.user?.name ?? '',
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
                                  if (state.data.avgRating != null) ...[
                                    RatingBar.builder(
                                      ignoreGestures: true,
                                      allowHalfRating: true,
                                      direction: Axis.horizontal,
                                      initialRating: state.data.avgRating ?? 0,
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
                                  ],
                                  Text(
                                    state.data.user?.country ?? '',
                                    style: const TextStyle(
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
                        if (state.data.bio != null) ...[
                          Text(
                            state.data.bio!,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                        ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              behavior: HitTestBehavior.opaque,
                              child: Column(
                                children: [
                                  Icon(
                                    state.data.isFavorite != true
                                        ? Icons.favorite_border
                                        : Icons.favorite,
                                    color: Colors.blue,
                                    size: 24.0,
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  const Text(
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
                              onTap: () async {
                                print(widget.dataFromList?.feedbacks?.length);
                                await showModalBottomSheet(
                                  context: context,
                                  builder: (context) => TeacherReviewsModal(
                                    feedbacks:
                                        widget.dataFromList?.feedbacks ?? [],
                                  ),
                                );
                              },
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
                        if (state.data.user != null &&
                            state.data.user!.language != null) ...[
                          Text(
                            'Languages',
                            style: DefaultStyle().t20Medium,
                          ),
                          Wrap(
                            children: state.data.user!.language!
                                .split(',')
                                .map((e) => TeacherTag(title: e))
                                .toList(),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                        ],
                        if (state.data.specialties != null) ...[
                          Text(
                            'Specialties',
                            style: DefaultStyle().t20Medium,
                          ),
                          Wrap(
                            children: state.data.specialties!
                                .split(',')
                                .map((e) => TeacherTag(title: e))
                                .toList(),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                        ],
                        Text(
                          'Suggested courses',
                          style: DefaultStyle().t20Medium,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        if (state.data.user?.courses?.isNotEmpty ?? false) ...[
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.data.user!.courses!.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                                horizontal: 8.0,
                              ),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  NavigationService.createCourseDetailRoute(
                                    courseId:
                                        state.data.user?.courses?[index].id ??
                                            '',
                                  ),
                                ),
                                behavior: HitTestBehavior.opaque,
                                child: Text(
                                  state.data.user!.courses![index].name ?? '',
                                  style: DefaultStyle().t16Medium.copyWith(
                                        color: AppColor().blueLightTxt,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                        ],
                        if (state.data.interests != null) ...[
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
                              state.data.interests!,
                              style: DefaultStyle().t14Regular,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                        ],
                        if (state.data.experience != null) ...[
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
                              state.data.experience!,
                              style: DefaultStyle().t14Regular,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                        ],
                        // Text(
                        //   'Booking Section',
                        //   style: DefaultStyle().t20Medium,
                        // ),
                        // const SizedBox(
                        //   height: 10.0,
                        // ),
                        // DatePickerView(
                        //   date: bookedDate,
                        //   active: true,
                        //   title: 'Select a day',
                        //   onDateChosen: (chosenDate) {
                        //     setState(() {
                        //       bookedDate = chosenDate;
                        //     });
                        //   },
                        //   isTo: true,
                        // ),
                      ],
                    ),
                  ),
                );
              } else if (state is TeacherDetailLoadingState) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              return const Center(
                child: Text(
                  'Error while loading profile tutor...',
                ),
              );
            },
          ),
        ),
      );
}
