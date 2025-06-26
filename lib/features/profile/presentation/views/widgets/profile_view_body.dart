import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/features/profile/data/models/get_profile_response_model.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/main_info_column.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:grad_project/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.profileModel});


final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
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
           ProfileCard(profileModel: profileModel,),
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
           MainInfoColumn(profileModel: profileModel,),
        ]),
      ),
    );
  }
}