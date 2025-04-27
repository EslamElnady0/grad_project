import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/quizes/ui/cubit/quiz_cubit/quiz_cubit.dart';
import 'package:grad_project/features/quizes/ui/widgets/custom_mcq_choice_widget.dart';

import '../../../../core/theme/app_colors.dart';

class CustomQuestionWidget extends StatelessWidget {
  const CustomQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.lightCyan,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0.56),
              blurRadius: 8.92,
              color: AppColors.black.withOpacity(0.1),
            )
          ],
          borderRadius: BorderRadius.circular(13.r)),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            Text(
              "10 - What is the main purpose of encapsulation in Object-Oriented Programming (OOP)?",
              style: AppTextStyles.font13BlackSemiBold,
            ),
            vGap(16),
            //TODO : switch case on question type (mcq , written) and put its own widget
            ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BlocBuilder<QuizCubit, QuizState>(
                    builder: (context, state) {
                      return CustomMcqChoiceWidget(
                        index: index,
                        choice: Constants.dummyChoices[index],
                        isSelected: context.read<QuizCubit>().selectedAnswer ==
                            Constants.dummyChoices[index],
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => vGap(10),
                itemCount: 4)
          ],
        ),
      ),
    );
  }
}
