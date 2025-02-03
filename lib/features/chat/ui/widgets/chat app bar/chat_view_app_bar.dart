import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/svg_icon_button.dart';
import '../../../../../core/helpers/app_assets.dart';
import '../../../../../generated/l10n.dart';

class ChatViewAppBar extends StatelessWidget {
  const ChatViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 10.h, bottom: 5.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.backGround,
      ),
      child: Row(
        children: [
          SvgIconButton(
              localized: true,
              iconPath: Assets.imagesSvgsBackButton,
              onPressed: () => GoRouter.of(context).pop()),
          hGap(10),
          CircleAvatar(
            backgroundImage: AssetImage(Assets.imagesAvatarDoc),
            radius: 20.r,
          ),
          hGap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Level 1",
                style: AppTextStyles.font16BlackSemiBold,
              ),
              Text.rich(TextSpan(
                  text: "45 ",
                  style: AppTextStyles.font10greenMedium,
                  children: [
                    TextSpan(
                        text: S.of(context).studentsOnlineNow,
                        style: AppTextStyles.font10greenMedium
                            .copyWith(color: AppColors.gray)),
                  ]))
            ],
          ),
          Spacer(),
          SvgIconButton(
              iconPath: Assets.imagesSvgsSearchIcon, onPressed: () {}),
          hGap(20),
          SvgIconButton(
              iconPath: Assets.imagesSvgsMoreOptionsIcon, onPressed: () {}),
        ],
      ),
    );
  }
}
