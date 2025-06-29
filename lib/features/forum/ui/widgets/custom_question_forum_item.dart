import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/get_time_info.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/item_header.dart';
import 'package:grad_project/features/forum/data/models/get_all_questions_response_model.dart';
import 'package:grad_project/features/forum/ui/widgets/show_qusetion_image.dart';
import 'package:grad_project/generated/l10n.dart';

class CustomQuestionForumItem extends StatelessWidget {
  const CustomQuestionForumItem({
    super.key,

    this.questionModel,
  });


  final QuestionModel? questionModel;

  @override
  Widget build(BuildContext context) {
      final timeInfo = getTimeInfo(context, questionModel?.createdAt);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5.r,
            spreadRadius: 3,
            color: const Color(0xff112316).withOpacity(0.15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemHeader(
            from: timeInfo.from,
            date: timeInfo.date,
            name: questionModel?.user?.name ?? "",
            specialization: "${questionModel?.user?.department} ${S.of(context).semester} ${questionModel?.user?.semester}" ,
          ),
          vGap(12),
          Text(
            questionModel?.body ?? "",
            style: AppTextStyles.font10greenMedium
                .copyWith(color: AppColors.black),
          ),
          if (questionModel != null &&
              questionModel!.imageUrl != null &&
              questionModel!.imageUrl!.isNotEmpty)
            ShowQusetionImage(imageUrl: questionModel!.imageUrl!)
        ],
      ),
    );
  }
}
