import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/doctor_info_section.dart';

class CustomAnsewrChat extends StatelessWidget {
  const CustomAnsewrChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.darkblue),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DoctorInfoSection(
                          name: "ابراهيم صيام",
                          specialization: "طالب فرقة رابعه",
                        ),
                        vGap(4),
                        Text("الحج ابراهيم سمبل باشا البلد",
                            style: AppTextStyles.font12GrayMedium.copyWith(
                              color: AppColors.darkblue,
                            ))
                      ],
                    )),
              ),
            ),
            hGap(8),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                    color: AppColors.darkblue,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.imagesSvgsLike,
                      color: AppColors.white,
                    ),
                    vGap(5),
                    Text(
                      "2",
                      style: AppTextStyles.font16WhiteBold,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
