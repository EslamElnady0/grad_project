import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';

import 'package:grad_project/features/annoucements/data/models/teachers_courses_response.dart';

import 'package:grad_project/features/annoucements/logic/get_teacher_cources_cubit/get_teacher_cources_cubit.dart';
import 'package:grad_project/features/annoucements/logic/update_annoucement_cubit/update_annoucement_cubit.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import 'display_and_drop_down_button.dart';

class EditDropDownAndDisplays extends StatelessWidget {
  const EditDropDownAndDisplays({super.key});

  @override
  Widget build(BuildContext context) {
    Announcement announcement = context.read<Announcement>();
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).subject,
              style: AppTextStyles.font14BlackBold
                  .copyWith(color: AppColors.darkerBlue),
            ),
            vGap(12),
            BlocBuilder<GetCourcesToFilterCubit, GetCourcesToFilterState>(
              builder: (context, state) => state.maybeWhen(
                orElse: () => Padding(
                  padding: EdgeInsetsDirectional.only(start: 25.w),
                  child: const CircularProgressIndicator(
                    color: AppColors.darkblue,
                  ),
                ),
                getCourcesToFilterSuccess: (data) {
                  data as TeachersCoursesResponse;

                  return BlocBuilder<UpdateAnnoucementCubit,
                      UpdateAnnoucementState>(
                    builder: (context, updateState) {
                      final cubit = context.read<UpdateAnnoucementCubit>();
                      cubit.coursesList = data.data;

                      if (cubit.selectedCourse == null ||
                          !data.data.any((course) =>
                              course.id == cubit.selectedCourse!.id)) {
                        cubit.selectCourse(data.data.firstWhere(
                          (course) => course.id == announcement.course.id,
                          orElse: () => data.data[0],
                        ));
                      }

                      final selectedCourse = cubit.selectedCourse;
                      final selectedCourseText =
                          "${selectedCourse!.name}    ${selectedCourse.semester.name}";

                      return DisplayAndDropDownButton(
                        value: selectedCourseText,
                        contentList: data.data,
                        onSelected: (course) {
                          context
                              .read<UpdateAnnoucementCubit>()
                              .selectCourse(course);
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
