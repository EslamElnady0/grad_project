import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/widgets/custom_dark_blue_container.dart';
import 'package:grad_project/features/annoucements/ui/widgets/courses_filter_item.dart';

import '../../../../core/helpers/spacing.dart';

class CoursesAnnoucementFilter extends StatelessWidget {
  const CoursesAnnoucementFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDarkBlueContainer(
      width: 375.w,
      height: 55.h,
      foregroundDecoration: const BoxDecoration(),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const CoursesFilterItem(
              title: "Data",
            );
          },
          separatorBuilder: (context, index) => hGap(10),
          itemCount: 15555),
    );
  }
}
