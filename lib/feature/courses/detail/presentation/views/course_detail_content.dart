import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/feature/courses/courses_list/presentation/blocs/courses_list_bloc/courses_list_bloc.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/custom_shimmer.dart';
import '../blocs/course_detail_bloc/course_detail_bloc.dart';
import '../widgets/simple_pdf_view.dart';

class CourseDetailContent extends StatelessWidget {
  const CourseDetailContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocListener<CourseDetailBloc, CourseDetailState>(
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
                    Assets.images.lettutorLogo.path,
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
              child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
                builder: (context, state) {
                  if (state is CourseDetailLoadDoneState) {
                    return Column(
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
                                child: CachedNetworkImage(
                                  imageUrl: state.data.data?.imageUrl ?? '',
                                  placeholder: (context, url) =>
                                      MyShimmer.shimmerBuilder(
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
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
                                  children: [
                                    Text(
                                      state.data.data?.name ?? '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Text(
                                      state.data.data?.description ?? '',
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
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
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24.0,
                          ),
                          child: Text(
                            state.data.data?.reason ?? '',
                            style: const TextStyle(
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
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24.0,
                          ),
                          child: Text(
                            state.data.data?.purpose ?? '',
                            style: const TextStyle(
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
                          children: [
                            const Icon(
                              Icons.person_add_alt,
                              size: 15.0,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              state.data.data?.level ?? '',
                              style: const TextStyle(
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
                          children: [
                            const Icon(
                              Icons.topic,
                              size: 15.0,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${state.data.data?.topics.length} topics',
                              style: const TextStyle(
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
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SimplePage(
                                    fileUrl: state.data.data?.topics[index]
                                            .nameFile ??
                                        '',
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                border: Border.all(
                                  color: Theme.of(context).dividerColor,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                  '${index + 1}. ${state.data.data?.topics[index].name ?? ''}'),
                            ),
                          ),
                          itemCount: state.data.data?.topics.length ?? 0,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10.0,
                          ),
                        )
                      ],
                    );
                  } else if (state is CoursesListLoadingState) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  return const Center(
                    child: Text('Error while loading course detail...'),
                  );
                },
              ),
            ),
          ),
        ),
      );
}
