import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key, required this.values,
  });

  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          gradient: Constants.primaryGrad,
          borderRadius: BorderRadius.circular(12)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: AppColors.primaryColordark,
          value: S.of(context).first_semester,
          icon: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SvgPicture.asset(Assets.imagesSvgsDropdown),
          ),
          items: customDropDownMenuItems(values: values),
          onChanged: (value) {
            value = value;
          },
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> customDropDownMenuItems(
    {required List<String> values}) {
  return values
      .map((value) => DropdownMenuItem(
            value: value,
            child: Text(
              value,
              style: AppTextStyles.font12WhiteSemiBold,
            ),
          ))
      .toList();
}
