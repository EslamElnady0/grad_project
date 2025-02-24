import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/features/forum/presentation/views/widgets/show_state_dialog.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../generated/l10n.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.darkblue,
            side: BorderSide(color: AppColors.darkblue, width: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: SvgPicture.asset(Assets.imagesSvgsLike),
          label: Text(S.of(context).interested,
              style: AppTextStyles.font16DarkerBlueSemiBold
                  .copyWith(fontSize: 14.sp)),
        ),
        Spacer(),
        ElevatedButton.icon(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkblue,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: SvgPicture.asset(Assets.imagesSvgsAnswers),
          label: Text(S.of(context).view_answers,
              style:
                  AppTextStyles.font16WhiteSemiBold.copyWith(fontSize: 14.sp)),
        ),
        Spacer(),
       CustomIconButton(
        icon: SvgPicture.asset(Assets.imagesSvgsChart),
          onTap:() {showStatsDialog(context);} ,
        ),


      ],
    );
  }
}
