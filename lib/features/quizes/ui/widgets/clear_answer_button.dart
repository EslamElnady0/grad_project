import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

import '../cubit/quiz_cubit/quiz_cubit.dart';

class ClearAnswerButton extends StatelessWidget {
  const ClearAnswerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<QuizCubit>().clearAnswer();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: AppColors.darkblue, borderRadius: BorderRadius.circular(10)),
        child: Text(
          S.of(context).clearAnswerSelection,
          style: AppTextStyles.font12WhiteMedium,
        ),
      ),
    );
  }
}
