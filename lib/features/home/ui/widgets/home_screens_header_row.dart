import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/widgets/svg_icon_button.dart';

class HomeScreensHeaderRow extends StatelessWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onSearchTap;
  const HomeScreensHeaderRow(
      {super.key, required this.onMenuTap, required this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgIconButton(
              iconPath: Assets.imagesSvgsMenuIcon, onPressed: onMenuTap),
          SvgIconButton(
              iconPath: Assets.imagesSvgsSearchIcon, onPressed: onSearchTap),
        ],
      ),
    );
  }
}
