import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/forum/data/models/question_and_answers_response_model.dart';
import 'package:grad_project/features/forum/ui/widgets/custom_like_toggle_answer.dart';
import 'package:grad_project/features/forum/ui/widgets/show_qusetion_image.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/doctor_info_section.dart';

class CustomAnswerItem extends StatelessWidget {
  const CustomAnswerItem({
    super.key,
    this.answerModel,
  });

  final AnswerModel? answerModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
  child: Row(
    children: [
      Expanded(
        child: Skeleton.leaf(
          enabled: true,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.darkblue),
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorInfoSection(
                    name: answerModel?.user?.name ?? "",
                    specialization:
                        "${answerModel?.user?.department} ${S.of(context).semester} ${answerModel?.user?.semester}",
                  ),
                  vGap(8),
                 if (answerModel != null &&
                     answerModel!.imageUrl != null &&
                     answerModel!.imageUrl!.isNotEmpty)
                   ShowQusetionImage(
                    height: 150.h,
                    imageUrl: answerModel!.imageUrl!),
                  vGap(8),
                  Text(
                    answerModel?.body ?? "",
                    style: AppTextStyles.font12GrayMedium.copyWith(
                      color: AppColors.darkblue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      hGap(8),
      CustomLikeToggleAnswer(
        questionId: answerModel?.id ?? "",
        likesCount: answerModel?.likes ?? 0,
        value: answerModel?.user?.liked ?? false,
      ),
    ],
  ),
);
  }
}
