import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/extensions.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';

class QuizNavigationPopUp extends StatelessWidget {
  const QuizNavigationPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.66,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            S.of(context).quizNavigation,
            style: AppTextStyles.font12BlackSemiBold,
          ),
          vGap(12),
          Directionality(
            textDirection: TextDirection.ltr,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 6.w,
                mainAxisSpacing: 16.h,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //TODO : Navigate to the question index
                    context.pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.darkblue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      (index + 1).toString(),
                      style: AppTextStyles.font12WhiteSemiBold,
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
