import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/forum/ui/views/answers_view.dart';
import 'package:grad_project/features/forum/ui/widgets/custom_like_toggle_question.dart';
import 'package:grad_project/features/forum/ui/widgets/show_state_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/get_all_questions_response_model.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key, this.questionModel});
  final QuestionModel? questionModel;

  void _handleViewAnswers(BuildContext context) {
    if ((questionModel?.answers ?? 0) == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
          content: Text(S.of(context).no_answers_available,
           style:  AppTextStyles.font16WhiteSemiBold.copyWith(fontSize: 14.sp),
          ),

        ),
      );  
    } else {
      GoRouter.of(context).push(
        AnswersView.routeName,
        extra: questionModel?.id ?? '',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
     CustomLikeToggleQuestion(
          questionId: questionModel?.id ?? '',
          value: questionModel?.user?.liked ?? false,
        ),

        const Spacer(),
        ElevatedButton.icon(       
          onPressed: () => _handleViewAnswers(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkblue,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: SvgPicture.asset(Assets.imagesSvgsAnswers),
          label: Text(S.of(context).view_answers,
              style:
                  AppTextStyles.font16WhiteSemiBold.copyWith(fontSize: 14.sp)),
        ),
     const   Spacer(),
        GestureDetector(
          onTap: () => showStatsDialog(context, questionModel),
          child: Skeleton.leaf(
            enabled: true,
            child: Container(
              decoration: BoxDecoration(
                gradient:const LinearGradient(
                  colors: [AppColors.redDark, AppColors.redlight],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding:const EdgeInsets.all(12),
              child: SvgPicture.asset(Assets.imagesSvgsChart),
            ),
          ),
        ),
      ],
    );
  }
}
