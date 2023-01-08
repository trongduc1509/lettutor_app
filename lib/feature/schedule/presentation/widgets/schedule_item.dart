import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../base/extension/time.dart';
import '../../../../base/theme/colors.dart';
import '../../domain/entities/schedule_entity.dart';
import '../../../../shared/widgets/expansion_panel.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/custom_shimmer.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ScheduleEntity item;

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
                DateTime.fromMillisecondsSinceEpoch(
                        item.scheduleDetailInfo?.startPeriodTimestamp ?? 0)
                    .convertDate('dd/MM/yyyy'),
                style: TextStyle(
                  color: AppColor().blackTitle,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // const SizedBox(
              //   height: 5.0,
              // ),
              // Text(
              //   '2 consecutive lessons',
              //   style: TextStyle(
              //     color: AppColor().blackTitle,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
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
                      child: CachedNetworkImage(
                        height: 80,
                        width: 80,
                        imageUrl: item.scheduleDetailInfo?.scheduleInfo
                                ?.tutorInfo?.avatar ??
                            '',
                        placeholder: (context, url) => MyShimmer.shimmerBuilder(
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage(Assets.images.blankAva.path))),
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
                            item.scheduleDetailInfo?.scheduleInfo?.tutorInfo
                                    ?.name ??
                                '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            item.scheduleDetailInfo?.scheduleInfo?.tutorInfo
                                    ?.country ??
                                '',
                            style: const TextStyle(
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
                      'Lesson Time: ${DateTime.fromMillisecondsSinceEpoch(item.scheduleDetailInfo?.startPeriodTimestamp ?? 0).convertDate('HH:mm')} - ${DateTime.fromMillisecondsSinceEpoch(item.scheduleDetailInfo?.endPeriodTimestamp ?? 0).convertDate('HH:mm')}',
                      style: TextStyle(
                        color: AppColor().blackTitle,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    // Text(
                    //   'Session 1: 09:30 - 09:55',
                    //   style: TextStyle(
                    //     color: AppColor().blackTitle,
                    //     fontSize: 15.0,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    // Text(
                    //   'Session 2: 10:00 - 10:25',
                    //   style: TextStyle(
                    //     color: AppColor().blackTitle,
                    //     fontSize: 15.0,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor().dividerColor,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child:
                          ExpandablePanel(title: 'Request for lesson', items: [
                        ExpandableModel(
                            title: item.studentRequest ??
                                'Currently there are no requests for this class. Please write down any requests for the teacher.')
                      ]),
                    )
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
