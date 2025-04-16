import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text_and_icon_button.dart';
import '../../../../generated/l10n.dart';

class AdminAddAnnoucementRow extends StatelessWidget {
  const AdminAddAnnoucementRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(children: [
            CustomTextAndIconButton(
              primaryButton: true,
              text: S.of(context).add_news,
              onTap: () {},
              icon: const Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
            const Spacer(),
            CustomTextAndIconButton(
              primaryButton: false,
              text: S.of(context).filter,
              onTap: () {},
              color: AppColors.darkblue,
              icon: const Icon(
                Icons.tune,
                color: AppColors.white,
              ),
            ),
          ]),
        ),
        vGap(12)
      ],
    );
  }
}
