import 'package:flutter/material.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/profile/data/models/get_profile_response_model.dart';
import 'package:grad_project/generated/l10n.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.profileModel,
  });

  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.darkblue, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          vGap(20),
          Text(
            S.of(context).profile_picture,
            style: AppTextStyles.font20WhiteBold,
          ),
          vGap(15),
          CircleAvatar(
            radius: 70,
            backgroundImage: profileModel.avatarUrl != null
                ? NetworkImage(
                    "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4841.jpg?semt=ais_hybrid&w=740")
                : const AssetImage(Assets.imagesTestPicture),
          ),
          vGap(10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyles.font14WhiteSemiBold,
              children: [
                TextSpan(text: "${profileModel.name}\n"),
                FlavorsFunctions.isStudent()
                    ? TextSpan(
                        text: "طالب في كلية الحاسبات والمعلومات\n",
                        style: AppTextStyles.font8WhiteSemiBold)
                    : TextSpan(
                        text: "مدرس في كلية الحاسبات والمعلومات",
                        style: AppTextStyles.font8WhiteSemiBold),
              ],
            ),
          ),
          FlavorsFunctions.isAdmin() &&
                  (profileModel as TeacherModel).description != null
              ? Column(
                  children: [
                    const Divider(
                      color: AppColors.gray,
                      indent: 70,
                      endIndent: 70,
                    ),
                    Text(
                      (profileModel as TeacherModel).description!,
                      style: AppTextStyles.font10GraySemiBold,
                    ),
                  ],
                )
              : vGap(5)
        ],
      ),
    );
  }
}
