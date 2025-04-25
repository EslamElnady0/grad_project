import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';
import 'package:grad_project/features/annoucements/ui/widgets/display_and_drop_down_button.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';

class DropDownAndDisplays extends StatefulWidget {
  const DropDownAndDisplays({super.key});

  @override
  State<DropDownAndDisplays> createState() => _DropDownAndDisplaysState();
}

class _DropDownAndDisplaysState extends State<DropDownAndDisplays> {
  @override
  Widget build(BuildContext context) {
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
            FutureBuilder(
              future: context.read<AddAnnoucementsCubit>().getTeacherCourses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Row(
                    children: [
                      hGap(30),
                      const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.darkerBlue,
                        strokeWidth: 2,
                      )),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("error: ${snapshot.error}",
                      style: const TextStyle(color: AppColors.redlight));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  String selectedCourseText =
                      "${snapshot.data![0].name}    ${snapshot.data![0].semester.name}";
                  context.read<AddAnnoucementsCubit>().selectedCourse =
                      snapshot.data![0];
                  return StatefulBuilder(
                    builder: (context, setState) => DisplayAndDropDownButton(
                      value: selectedCourseText,
                      contentList: snapshot.data ?? [],
                      onSelected: (course) {
                        setState(() {
                          selectedCourseText =
                              "${course.name}    ${course.semester.name}";
                        });
                        context
                            .read<AddAnnoucementsCubit>()
                            .selectCourse(course);
                      },
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return Text(
                    "لا توجد مواد متاحة",
                    style: AppTextStyles.font14BlackBold
                        .copyWith(color: AppColors.darkerBlue),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
