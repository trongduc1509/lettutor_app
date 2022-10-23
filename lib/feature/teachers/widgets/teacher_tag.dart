import 'package:flutter/material.dart';

import '../../../base/theme/colors.dart';

class TeacherTag extends StatelessWidget {
  const TeacherTag({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: Chip(
        label: Text(title),
        backgroundColor: AppColor().blueLightBg,
      ),
    );
  }
}
