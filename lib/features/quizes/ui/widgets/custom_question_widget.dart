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
import '../../data/models/get_quiz_using_id_response.dart';
import '../cubit/quiz_navigation_cubit/quiz_question_navigation_cubit.dart';

class CustomQuestionWidget extends StatelessWidget {
  const CustomQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final quizData = context.read<GetQuizByIdResponse>();
    return BlocBuilder<QuizQuestionNavigatorCubit, int>(
      builder: (context, currentIndex) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.lightCyan,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0.56),
                  blurRadius: 8.92,
                  color: AppColors.black.withOpacity(0.1),
                )
              ],
              borderRadius: BorderRadius.circular(13.r),
            ),
            child: BlocBuilder<QuizCubit, QuizState>(
              builder: (context, state) {
                final quizCubit = context.read<QuizCubit>();
                final currentQuestion = quizData.data.questions[currentIndex];
                return Column(
                  children: [
                    Text(
                      currentQuestion.question,
                      style: AppTextStyles.font13BlackSemiBold,
                    ),
                    vGap(16),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final choiceLetter = Constants.dummyChoices[index];
                        final isSelected =
                            quizCubit.getSelectedAnswer(currentIndex) ==
                                choiceLetter;
                        return CustomMcqChoiceWidget(
                          index: index,
                          choice: currentQuestion.answers[index].answer,
                          isSelected: isSelected,
                          questionIndex: currentIndex,
                        );
                      },
                      separatorBuilder: (context, index) => vGap(10),
                      itemCount: currentQuestion.answers.length,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
