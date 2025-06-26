import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/subjects/ui/widgets/SubjectSemestertitle.dart';
import 'package:grad_project/features/subjects/ui/widgets/status_dropdoen.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../generated/l10n.dart';
import '../manager/subjects_filter_cubit.dart';

class CustomSupjectsFilter extends StatelessWidget {
  const CustomSupjectsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).classes,
                style: AppTextStyles.font12GrayMedium,
              ),
              vGap(12),
              BlocBuilder<SubjectsFilterCubit, int>(
                builder: (context, selectedSemester) {
                  return Row(
                    children: [
                      SubjectSemesterTitle(
                        title: S.of(context).semester_1,
                        isPressed: selectedSemester == 1,
                        onTap: () => context
                            .read<SubjectsFilterCubit>()
                            .toggleSemester(1),
                      ),
                      hGap(8),
                      SubjectSemesterTitle(
                        title: S.of(context).semester_2,
                        isPressed: selectedSemester == 2,
                        onTap: () => context
                            .read<SubjectsFilterCubit>()
                            .toggleSemester(2),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          hGap(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).status,
                style: AppTextStyles.font12GrayMedium,
              ),
              vGap(8),
              const StatusDropdown()
            ],
          ),
        ],
      ),
    );
  }
}
