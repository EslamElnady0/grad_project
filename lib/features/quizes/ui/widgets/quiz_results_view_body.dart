import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_inner_screens_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../dashboard/ui/widgets/custom_search_container.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import 'students_results_list_view_bloc_builder.dart';

class QuizResultsViewBody extends StatelessWidget {
  const QuizResultsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(12),
        symmetricPaddingWidget(
            child: CustomInnerScreensAppBar(title: S.of(context).results)),
        vGap(10),
        symmetricPaddingWidget(
            horizontalPadding: 36.w,
            child: TitleTextWidget(text: S.of(context).results_description)),
        vGap(12),
        symmetricPaddingWidget(child: const CustomSearchContainer()),
        vGap(12),
        symmetricPaddingWidget(
          child: Row(
            children: [
              Text(
                S.of(context).name,
                style: AppTextStyles.font12BlackMedium,
              ),
              const Spacer(),
              Text(
                S.of(context).score,
                style: AppTextStyles.font12BlackMedium,
              ),
              hGap(15),
              Text(
                S.of(context).finalDegree,
                style: AppTextStyles.font12BlackMedium,
              ),
              hGap(5)
            ],
          ),
        ),
        vGap(12),
        const Expanded(
          child: StudentsResultsListViewBlocBuilder(),
        ),
      ],
    );
  }
}
