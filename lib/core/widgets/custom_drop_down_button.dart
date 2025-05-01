import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.values,
    required this.initialValue,
  });

  final List<String> values;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          gradient: Constants.primaryGrad,
          borderRadius: BorderRadius.circular(12)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(12),
          dropdownColor: AppColors.primaryColordark,
          value: initialValue,
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
              style: AppTextStyles.font12WhiteMedium,
            ),
          ))
      .toList();
}
