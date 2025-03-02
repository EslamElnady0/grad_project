
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class CompleteIcon extends StatelessWidget {
  const CompleteIcon({super.key, required this.isComplete});
  final bool isComplete;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.5),
        border: Border.all(
            color: isComplete ? Colors.transparent : AppColors.black),
    gradient: isComplete 
        ?const LinearGradient(
            colors: [AppColors.primaryColorlight, AppColors.primaryColordark],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ) 
        : null
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.imagesSvgsCheck,
            color: isComplete ? AppColors.white : AppColors.black,
          ),
          hGap(5),
          Text(
            S.of(context).complete,
            style: AppTextStyles.font10BlackSemiBold.copyWith(
                color: isComplete ? AppColors.white : AppColors.black),
          )
        ],
      ),
    );
  }
}
