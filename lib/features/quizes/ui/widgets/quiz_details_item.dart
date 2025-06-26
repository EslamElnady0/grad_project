import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_red_grad_container.dart';

class QuizDetailsItem extends StatelessWidget {
  final String title;
  final String value;
  const QuizDetailsItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomRedGradContainer(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            raduis: 10,
            child: Text(
              title,
              style: AppTextStyles.font12BlackSemiBold
                  .copyWith(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ),
          vGap(16),
          Text(value, style: AppTextStyles.font13BlackSemiBold)
        ],
      ),
    );
  }
}
