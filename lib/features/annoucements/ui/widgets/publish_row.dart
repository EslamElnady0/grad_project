import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_red_grad_container.dart';
import '../../../../core/widgets/svg_icon_button.dart';
import '../../../../generated/l10n.dart';

class PublishRow extends StatelessWidget {
  const PublishRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.darkblue,
                borderRadius: BorderRadius.circular(10)),
            child: SvgIconButton(
                iconPath: Assets.imagesSvgsEyeCrossedIcon, onPressed: () {})),
        GestureDetector(
          onTap: () {},
          child: CustomRedGradContainer(
            alignment: Alignment.center,
            raduis: 12,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 26.w),
            child: Text(
              S.of(context).publish,
              style: AppTextStyles.font13WhiteBold,
            ),
          ),
        )
      ],
    );
  }
}
