import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_red_grad_container.dart';
import '../../../../core/helpers/spacing.dart';

class CustomRedCourseButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomRedCourseButton(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomRedGradContainer(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesSvgsThreeLinesVerticalIcon),
              hGap(8),
              Text(
                text,
                style: AppTextStyles.font14WhiteSemiBold,
              )
            ]),
      ),
    );
  }
}
