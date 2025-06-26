import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_white_drop_shadowed_container.dart';
import '../../data/models/quiz_details_response.dart';

class StudentResultTile extends StatelessWidget {
  final int quizId;
  final QuizStudent student;
  final int maxDegree;
  final VoidCallback? onTap;

  const StudentResultTile({
    super.key,
    required this.student,
    required this.maxDegree,
    this.onTap,
    required this.quizId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomWhiteDropShadowedContainer(
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        child: Row(
          children: [
            Image.asset(
              Assets.imagesAvatarDoc,
              height: 30,
              width: 30,
            ),
            hGap(10),
            Text(
              student.studentName,
              style: AppTextStyles.font11BlackMedium,
            ),
            const Spacer(),
            Text(
              student.degree.toString(),
              style: AppTextStyles.font11BlackMedium,
            ),
            hGap(38),
            Text(
              maxDegree.toString(),
              style: AppTextStyles.font11BlackMedium,
            ),
            hGap(12)
          ],
        ),
      ),
    );
  }
}
