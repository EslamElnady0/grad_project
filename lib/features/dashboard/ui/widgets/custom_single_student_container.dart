import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_white_drop_shadowed_container.dart';

class CustomSingleStudentContainer extends StatelessWidget {
  const CustomSingleStudentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWhiteDropShadowedContainer(
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
            "اسلام ايهاب محمد لطفي",
            style: AppTextStyles.font11BlackMedium,
          ),
          const Spacer(),
          Text(
            "6",
            style: AppTextStyles.font11BlackMedium,
          ),
          hGap(24),
          Text(
            "مستجد",
            style: AppTextStyles.font11BlackMedium,
          ),
        ],
      ),
    );
  }
}
