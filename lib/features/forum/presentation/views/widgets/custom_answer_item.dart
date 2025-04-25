import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

import '../../../../../core/widgets/item_header.dart';

class CustomAnswerItem extends StatelessWidget {
  const CustomAnswerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Container(
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
                color: const Color(0xff112316).withOpacity(0.15)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemHeader(
              date: "12/10/2023",
              from: "2 mins ago",
              name: "ابراهيم صيام",
              specialization: "طالب فرقة رابعه",
            ),
            vGap(12),
            Text(
              "📢 إعلان هام",
              style: AppTextStyles.font10greenMedium
                  .copyWith(color: AppColors.black),
            ),
            vGap(20),
            Text(
              "يرجى من جميع الطلاب حضور المحاضرة القادمة في موعدها، حيث سيتم مناقشة المواضيع الأساسية للامتحان النصفي القادم، وستشمل المحاضرة مراجعة شاملة للنماذج السابقة والأسئلة المتكررة.",
              style: AppTextStyles.font10greenMedium
                  .copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
