import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_form_field.dart';
import 'package:grad_project/generated/l10n.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 11,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.white),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: CustomTextFormField(
                maxLines: 1,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 1),
                fillColor: AppColors.backGround,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: SvgPicture.asset(
                    Assets.imagesSvgsMagnifyingGlassIcon,
                    colorFilter: const ColorFilter.mode(
                        AppColors.gray, BlendMode.srcIn),
                  ),
                ),
                hintText: S.of(context).enter_student_name_or_code,
                textInputType: TextInputType.text,
              ),
            ),
          ),
          hGap(10),
          Container(
            height: 40,
            decoration: BoxDecoration(
                gradient: Constants.primaryGrad,
                borderRadius: BorderRadius.circular(14)),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  S.of(context).search,
                  style: AppTextStyles.font12WhiteMedium,
                )),
          ),
        ],
      ),
    );
  }
}