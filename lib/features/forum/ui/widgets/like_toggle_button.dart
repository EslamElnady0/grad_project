import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/forum/logic/toggle_like_cubit/toggle_like_cubit.dart';
import 'package:grad_project/generated/l10n.dart';

class LikeToggleButton extends StatefulWidget {
  const LikeToggleButton({super.key, required this.value, required this.questionId});
final String questionId;
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
    
    context.read<ToggleLikeCubit>().toggleLike(
      widget.questionId,
       
    );

  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: _toggleLike,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkblue,
        shadowColor: AppColors.darkblue,
        side:  BorderSide(color: AppColors.darkblue, width:  isLiked ?3  : 2),
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

