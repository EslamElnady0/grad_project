import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/svg_icon_button.dart';

class CustomSearchTextField extends StatelessWidget {
  final String hintText;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  const CustomSearchTextField(
      {super.key,
      required this.hintText,
      this.focusNode,
      required this.controller,
      this.onChanged,
      this.onSubmitted,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      focusNode: focusNode,
      controller: controller,
      style: AppTextStyles.font12BlackSemiBold,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.r),
            child: SvgIconButton(
                colorFilter:
                    const ColorFilter.mode(AppColors.gray, BlendMode.srcIn),
                iconPath: Assets.imagesSvgsSearchIcon,
                onPressed: () {}),
          ),
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          hintText: hintText,
          hintStyle: AppTextStyles.font12GrayMedium,
          border: Constants.shadowedInputBorder,
          enabledBorder: Constants.shadowedInputBorder,
          focusedBorder: Constants.shadowedInputBorder,
          filled: true,
          fillColor: AppColors.white),
    );
  }
}
