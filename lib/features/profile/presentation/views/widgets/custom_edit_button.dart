import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/profile/presentation/views/edit_profile_view.dart';
import 'package:grad_project/generated/l10n.dart';

class CustomEditButton extends StatelessWidget {
  const CustomEditButton({
    super.key,required this.currentAvatarUrl,
  });

final String? currentAvatarUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(EditProfileView.routeName,extra: currentAvatarUrl,);
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.darkblue,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.imagesSvgsEditPictureIcon,
              color: AppColors.white,
              width: 15,
              height: 15,
            ),
            hGap(5),
            Text(
              S.of(context).edit,
              style: AppTextStyles.font13WhiteBold,
            )
          ],
        ),
      ),
    );
  }
}
