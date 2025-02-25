import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/theme/app_colors.dart';

class UserAvatarAndName extends StatelessWidget {
  final bool flag;
  final String sender;
  const UserAvatarAndName(
      {super.key, required this.flag, required this.sender});

  @override
  Widget build(BuildContext context) {
    return flag
        ? Column(
            children: [
              Text(sender,
                  style: AppTextStyles.font10GraySemiBold
                      .copyWith(color: AppColors.black)),
              vGap(4),
              CircleAvatar(
                radius: 18.r,
                backgroundImage: const AssetImage(Assets.imagesAvatarDoc),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
