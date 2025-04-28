import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/annoucements/ui/widgets/title_and_desc_text_fields.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/add_quiz_cubit/add_quiz_cubit.dart';
import 'add_quiz_drop_downs.dart';

class AddQuizViewBody extends StatelessWidget {
  const AddQuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInnerScreensAppBar(title: S.of(context).createQuiz),
          vGap(4),
          TitleTextWidget(text: S.of(context).quizHelperText),
          vGap(22),
          TitleAndDescTextFields(
              formKey: context.read<AddQuizCubit>().formKey,
              titleController: context.read<AddQuizCubit>().titleController,
              descController: context.read<AddQuizCubit>().descController,
              title: S.of(context).quizTitle,
              titleHintText: S.of(context).quizTitleHelper,
              desc: S.of(context).quizDescription,
              descHintText: S.of(context).quizDescriptionHelper),
          vGap(12),
          const AddQuizDropDowns(),
          vGap(14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).scheduleQuiz,
                style: AppTextStyles.font14BlackBold
                    .copyWith(color: AppColors.darkerBlue),
              ),
              vGap(5),
              Text(S.of(context).scheduleQuizHelper,
                  style: AppTextStyles.font12GrayMedium),
            ],
          ),
          vGap(12),
        ],
      ),
    );
  }
}
