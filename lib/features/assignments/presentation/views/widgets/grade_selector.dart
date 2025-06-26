import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/logic/cubits/assign_grade_cubit/assign_grade_cubit.dart';
import 'package:grad_project/generated/l10n.dart';

class GradeSelector extends StatefulWidget {
  const GradeSelector(
      {super.key, required this.totalDegree, required this.answerId});

  final int totalDegree;
  final int answerId;

  @override
  State<GradeSelector> createState() => _GradeSelectorState();
}

class _GradeSelectorState extends State<GradeSelector> {
  int degree = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.backGround,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Text(
                "${degree}",
                style: AppTextStyles.font14DarkBlueMedium,
              ),
              hGap(10),
              Column(
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(Assets.imagesSvgsIncreaseIcon),
                    onTap: () {
                      setState(() {
                        if (degree < widget.totalDegree) {
                          degree++;
                        }
                      });
                    },
                  ),
                  vGap(10),
                  GestureDetector(
                    child: SvgPicture.asset(Assets.imagesSvgsDecreaseIcon),
                    onTap: () {
                      setState(() {
                        if (degree > 0) {
                          degree--;
                        }
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        hGap(5),
        Container(
          height: 38,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: Constants.secondaryGrad),
          child: TextButton(
            onPressed: () {
              context
                  .read<AssignGradeCubit>()
                  .assignGrade(widget.answerId, degree);
            },
            child: Text(
              S.of(context).evaluation,
              style: AppTextStyles.font12WhiteSemiBold,
            ),
          ),
        )
      ],
    );
  }
}
