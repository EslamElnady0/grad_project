import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/forum/ui/views/answers_view.dart';
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
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
     LikeToggleButton(
          value: questionModel?.user?.liked ?? false,
        ),
        const SizedBox(width: 10),
        OutlinedButton.icon(
          onPressed: () {
            GoRouter.of(context).push(AnswersView.routeName);
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.darkblue,
            side: const BorderSide(color: AppColors.darkblue, width: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: SvgPicture.asset(Assets.imagesSvgsCommentBubbleIcon),
          label: Text("S.of(context).comment",
              style:
                  AppTextStyles.font16DarkerBlueSemiBold.copyWith(fontSize: 14.sp)),
     ),
        const Spacer(),
        ElevatedButton.icon(
          onPressed: () {
            GoRouter.of(context).push(AnswersView.routeName);
          },
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

class LikeToggleButton extends StatefulWidget {
  const LikeToggleButton({super.key, required this.value});

  final bool value;

  @override
  State<LikeToggleButton> createState() => _LikeToggleButtonState();
}

class _LikeToggleButtonState extends State<LikeToggleButton> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.value;
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    print('Is Liked: $isLiked');
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: _toggleLike,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkblue,
        side: const BorderSide(color: AppColors.darkblue, width: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: Icon(
        isLiked ? Icons.thumb_up : Icons.thumb_up_off_alt,
        color: AppColors.darkblue,
      ),
      label: Text(
        S.of(context).interested,
        style: AppTextStyles.font16DarkerBlueSemiBold.copyWith(fontSize: 14.sp),
      ),
    );
  }
}

