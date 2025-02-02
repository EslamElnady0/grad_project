import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/widgets/svg_icon_button.dart';

class HomeScreensHeaderRow extends StatelessWidget {
  const HomeScreensHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgIconButton(iconPath: Assets.imagesSvgsMenuIcon, onPressed: () {}),
          SvgIconButton(
              iconPath: Assets.imagesSvgsSearchIcon, onPressed: () {}),
        ],
      ),
    );
  }
}
