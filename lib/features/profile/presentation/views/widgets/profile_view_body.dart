import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/info_widget_list_view.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:grad_project/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labels = getLabels(context);
    List<String> info = Constants.info;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(children: [
          CustomInnerScreensAppBar(
            title: S.of(context).profile,
          ),
          TitleTextWidget(
            text: S.of(context).profile_welcome_message,
          ),
          vGap(10),
          const ProfileCard(),
          const Divider(
            height: 30,
            color: AppColors.gray,
            indent: 70,
            endIndent: 70,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.darkblue,
            ),
            height: 50,
            child: Center(
              child: Text(
                S.of(context).main_info,
                style: AppTextStyles.font13WhiteBold,
              ),
            ),
          ),
          vGap(20),
          InfoWidgetListView(labels: labels, info: info)
        ]),
      ),
    );
  }
}

List<String> getLabels(BuildContext context) {
  return [
    S.of(context).name,
    S.of(context).college,
    S.of(context).level,
    S.of(context).group,
    S.of(context).section,
    S.of(context).Overall_Grade
  ];
}
