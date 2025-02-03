import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../../../../core/helpers/app_assets.dart';

class DoctorInfoSection extends StatelessWidget {
  const DoctorInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: AssetImage(Assets.imagesAvatarDoc),
        ),
        hGap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "أ.د. أحمد المنوفي",
              style: AppTextStyles.font13BlackSemiBold,
            ),
            Text(
              "أستاذ ودكتور مادة OOP",
              style: AppTextStyles.font9GrayMedium,
            ),
          ],
        )
      ],
    );
  }
}
