import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/forum/logic/toggle_like_cubit/toggle_like_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLikeToggleAnswer extends StatefulWidget {
  const CustomLikeToggleAnswer({
    super.key,
    required this.value,
    required this.questionId,
    required this.likesCount,
  });

  final String questionId;
  final int likesCount;
  final bool value;

  @override
  State<CustomLikeToggleAnswer> createState() => _CustomLikeToggleAnswerState();
}

class _CustomLikeToggleAnswerState extends State<CustomLikeToggleAnswer> {
  late bool isLiked;
  late int likesCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.value;
    likesCount = widget.likesCount;
  }

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        likesCount--;
      } else {
        likesCount++;
      }
      isLiked = !isLiked;
    });

    context.read<ToggleLikeCubit>().toggleLike(
      questionId: widget.questionId,
      like: ApiConstants.answerlike
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLike,
      child:  Skeleton.leaf(
            enabled: true,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w , vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.darkblue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isLiked ? Icons.thumb_up : Icons.thumb_up_off_alt,
                color: AppColors.white,
              ),
              vGap(5),
              Text(
                likesCount.toString(),
                style: AppTextStyles.font16WhiteBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
