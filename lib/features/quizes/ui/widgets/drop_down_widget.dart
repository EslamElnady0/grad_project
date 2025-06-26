import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class DropDownWidget<T> extends StatelessWidget {
  final String value;
  final String? type;
  final Function(T)? onSelected;
  final List<T> contentList;
  const DropDownWidget(
      {super.key,
      required this.value,
      this.onSelected,
      required this.contentList,
      this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Adjust shadow color
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: PopupMenuButton(
        onSelected: onSelected,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.zero,
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: AppTextStyles.font13BlackBold
                  .copyWith(color: AppColors.darkGray),
            ),
            SvgPicture.asset(Assets.imagesSvgsIosArrowIcon)
          ],
        ),
        itemBuilder: (context) {
          return contentList.map((entryValue) {
            return PopupMenuItem<T>(
              value: entryValue,
              child: Text(
                "${entryValue.toString()}${type != null ? "  $type" : ""}",
                style: AppTextStyles.font13BlackBold
                    .copyWith(color: AppColors.darkGray),
              ),
            );
          }).toList();
        },
      ),
    );
  }
}
