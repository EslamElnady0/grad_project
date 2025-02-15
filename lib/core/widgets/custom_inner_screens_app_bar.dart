import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/svg_icon_button.dart';

import '../../../../core/theme/app_colors.dart';

class CustomInnerScreensAppBar extends StatelessWidget {
  final String title;
  const CustomInnerScreensAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: AppTextStyles.font16BlackMedium,
              ),
            ),
            PositionedDirectional(
              start: 0,
              top: 0,
              bottom: 0,
              child: SvgIconButton(
                  localized: true,
                  iconPath: Assets.imagesSvgsBackButton,
                  onPressed: () => context.pop()),
            ),
          ],
        ),
        Divider(
          color: AppColors.black.withOpacity(0.5),
        )
      ],
    );
  }
}
