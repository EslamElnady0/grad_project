import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.darkblue,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          vGap(20),
          Text(
            S.of(context).profile_picture,
            style: AppTextStyles.font20WhiteBold,
          ),
          vGap(15),
          Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(Assets.imagesTestPicture),
                ),
                Positioned(
                  top: -5,
                  right: 10,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.darkblue,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          Assets.imagesSvgsEditPictureIcon,
                          width: 15,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
          vGap(10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyles.font14WhiteSemiBold,
              children: const[
                TextSpan(text: "إسلام إيهاب محمد لطفي\n"), // First line
                TextSpan(text: "(123456789)")
              ],
            ),
          ),
          const Divider(
            color: AppColors.gray,
            indent: 70,
            endIndent: 70,
          ),
          vGap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${S.of(context).Group}:2",
                style: AppTextStyles.font14WhiteSemiBold,
              ),
              hGap(60),
              Text(
                "${S.of(context).Section}:4",
                style: AppTextStyles.font14WhiteSemiBold,
              )
            ],
          ),
          vGap(20)
        ],
      ),
    );
  }
}
