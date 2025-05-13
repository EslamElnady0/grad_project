import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/extensions.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/get_quiz_using_id_response.dart';
import '../cubit/quiz_navigation_cubit/quiz_question_navigation_cubit.dart';

class QuizNavigationPopUp extends StatelessWidget {
  final List<Question> quizQuestions;
  const QuizNavigationPopUp({super.key, required this.quizQuestions});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.66,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            S.of(context).quizNavigation,
            style: AppTextStyles.font12BlackSemiBold,
          ),
          vGap(12),
          Directionality(
            textDirection: TextDirection.ltr,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 6.w,
                mainAxisSpacing: 16.h,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<QuizQuestionNavigatorCubit>().goTo(index);
                    context.pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: index ==
                              context.read<QuizQuestionNavigatorCubit>().state
                          ? AppColors.darkblue
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: !(index ==
                              context.read<QuizQuestionNavigatorCubit>().state)
                          ? Border.all(color: AppColors.darkblue, width: 1.5)
                          : null,
                    ),
                    child: Text(
                      (index + 1).toString(),
                      style: AppTextStyles.font12WhiteSemiBold.copyWith(
                        color: index ==
                                context.read<QuizQuestionNavigatorCubit>().state
                            ? AppColors.white
                            : AppColors.darkblue,
                      ),
                    ),
                  ),
                );
              },
              itemCount: quizQuestions.length,
            ),
          )
        ],
      ),
    );
  }
}
