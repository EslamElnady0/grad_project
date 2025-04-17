import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../helpers/app_assets.dart';

class DoctorInfoSection extends StatelessWidget {
  const DoctorInfoSection({super.key, required this.name, required this.specialization});
final String name;
final String specialization;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: const AssetImage(Assets.imagesAvatarDoc),
        ),
        hGap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.font13BlackSemiBold,
            ),
            Text(
            specialization,
              style: AppTextStyles.font9GrayMedium,
            ),
          ],
        )
      ],
    );
  }
}
