import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';
import '../../../../core/helpers/spacing.dart';
import 'custom_search_container.dart';
import 'registered_students_list_view.dart';

class RegisteredStudentsViewBody extends StatelessWidget {
  const RegisteredStudentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(12),
        symmetricPaddingWidget(
            child: CustomInnerScreensAppBar(
                title: S.of(context).registered_students)),
        vGap(10),
        symmetricPaddingWidget(
            horizontalPadding: 36.w,
            child: TitleTextWidget(
                text: S.of(context).registered_students_description)),
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
              Spacer(),
              Text(
                S.of(context).section,
                style: AppTextStyles.font12BlackMedium,
              ),
              hGap(15),
              Text(
                S.of(context).statuss,
                style: AppTextStyles.font12BlackMedium,
              ),
              hGap(5)
            ],
          ),
        ),
        vGap(12),
        const Expanded(
          child: RegisteredStudentsListView(),
        ),
      ],
    );
  }
}
