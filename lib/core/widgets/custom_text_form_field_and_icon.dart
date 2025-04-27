import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../generated/l10n.dart';

import '../helpers/localizationa.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomTextFormFieldAndicon extends StatelessWidget {
  final String hintText;
  final String icon;
  final int maxLines;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const CustomTextFormFieldAndicon({
    super.key,
    required this.hintText,
    required this.icon,
    this.maxLines = 1,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).pleaseEnterRequiredFields;
            }
            return null;
          },
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: const SizedBox(width: 10),
            hintText: hintText,
            hintStyle: AppTextStyles.font12GrayMedium,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.darkblue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),
        ),
        Positioned(
          top: 18,
          left: isArabicLocale(context) ? null : 10,
          right: isArabicLocale(context) ? 10 : null,
          child:SvgPicture.asset(
          icon,
          fit: BoxFit.none,
          width: 10,
          height: 20,
          color: AppColors.gray
        ),
        ),
      ],
    );
  }
}
