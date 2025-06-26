import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_white_drop_shadowed_container.dart';
import 'package:grad_project/features/quizes/logic/student_quiz_answers_cubit/student_quiz_answers_cubit.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_hollow_button.dart';
import '../../../../generated/l10n.dart';
import 'quiz_label_widget_content.dart';
import 'custom_review_mcq_choice_widget.dart';

class CustomStudentReviewQuestionWidget extends StatefulWidget {
  const CustomStudentReviewQuestionWidget({super.key});

  @override
  State<CustomStudentReviewQuestionWidget> createState() =>
      _CustomStudentReviewQuestionWidgetState();
}

class _CustomStudentReviewQuestionWidgetState
    extends State<CustomStudentReviewQuestionWidget> {
  int currentIndex = 0;

  void _next(int total) {
    if (currentIndex < total - 1) {
      setState(() => currentIndex++);
    }
  }

  void _prev() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentQuizAnswersCubit, StudentQuizAnswersState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (error) => Center(child: Text(error)),
          success: (data) {
            final questions = data.data.questions;
            final question = questions[currentIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                vGap(12),
                QuizLabelWidgetContent(
                  title: data.data.title,
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).studentDegree,
                        style: AppTextStyles.font16BlackBold,
                      ),
                      vGap(10),
                      CustomWhiteDropShadowedContainer(
                        width: 100.w,
                        child: Text(
                          "${data.data.studentDegree}/${data.data.maxDegree}",
                          style: AppTextStyles.font16BlackBold,
                        ),
                      ),
                    ],
                  ),
                ),
                vGap(24),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${currentIndex + 1} - ",
                              style: AppTextStyles.font13BlackBold
                                  .copyWith(color: AppColors.darkblue),
                            ),
                            Expanded(
                              child: Text(
                                question.question,
                                style: AppTextStyles.font13BlackSemiBold,
                              ),
                            ),
                          ],
                        ),
                        vGap(16),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: question.answers.length,
                          itemBuilder: (context, index) {
                            final answer = question.answers[index];
                            final isStudentAnswer =
                                answer.id == question.studentAnswer;
                            final isCorrect = answer.correct == 1;
                            return CustomReviewMcqChoiceWidget(
                              index: index,
                              choice: answer.answer,
                              isStudentAnswer: isStudentAnswer,
                              isCorrect: isCorrect,
                            );
                          },
                          separatorBuilder: (context, index) => vGap(10),
                        ),
                        vGap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomHollowButton(
                                borderColor: AppColors.darkblue,
                                onPressed: _prev,
                                child: Text(
                                  S.of(context).previous,
                                  style: AppTextStyles.font10BlackMedium
                                      .copyWith(color: AppColors.darkblue),
                                )),
                            CustomHollowButton(
                                borderColor: AppColors.darkblue,
                                onPressed: () => _next(questions.length),
                                child: Text(
                                  S.of(context).next,
                                  style: AppTextStyles.font10BlackMedium
                                      .copyWith(color: AppColors.darkblue),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
