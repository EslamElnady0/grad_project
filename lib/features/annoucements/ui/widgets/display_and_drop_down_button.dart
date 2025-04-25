import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class DisplayAndDropDownButton extends StatelessWidget {
  final String title;
  final String value;
  final void Function(String)? onSelected;
  final List<String> contentList;
  const DisplayAndDropDownButton(
      {super.key,
      required this.title,
      required this.value,
      required this.contentList,
      this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.font14BlackBold
              .copyWith(color: AppColors.darkerBlue),
        ),
        vGap(12),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white, // Adjust the background color as needed
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Adjust shadow color
                blurRadius: 10, // Softness of the shadow
                spreadRadius: 1, // Size of the shadow
                offset: const Offset(0, 2), // Position of shadow
              ),
            ],
          ),
          child: PopupMenuButton(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            padding: EdgeInsets.zero,
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: AppTextStyles.font13BlackBold
                        .copyWith(color: AppColors.darkGray),
                  ),
                ),
                SvgPicture.asset(Assets.imagesSvgsIosArrowIcon)
              ],
            ),
            itemBuilder: (context) {
              return contentList.map((String value) {
                return PopupMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: AppTextStyles.font13BlackBold
                        .copyWith(color: AppColors.darkGray),
                  ),
                );
              }).toList();
            },
            onSelected: onSelected,
          ),
        )
      ],
    );
  }
}
