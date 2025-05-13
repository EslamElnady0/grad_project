import 'package:flutter/material.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

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
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage(Assets.imagesTestPicture),
          ),
          vGap(10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyles.font14WhiteSemiBold,
              children: [
                const TextSpan(text: "إسلام إيهاب محمد لطفي\n"),
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
          FlavorsFunctions.isAdmin()
              ? Column(
                  children: [
                    const Divider(
                      color: AppColors.gray,
                      indent: 70,
                      endIndent: 70,
                    ),
                    Text(
                      "أستاذ متميز في قسم علوم الحاسب، تخرج عام 1941 وما زال ينبض بالحيوية وكأنه في ريعان الشباب بخبرة 39 عامًا ليس علي كوكب الأرض، بل امتدت إلى المريخ وزحل، حيث استلهم من عوالمهما تقنيات لم تصل إليها البشرية بعد. عاد إلينا بتواضعه المعهود ليشارك معرفته، ويدفع طلابه للأمام، نحو آفاق لم يسبقهم إليها أحد!",
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
