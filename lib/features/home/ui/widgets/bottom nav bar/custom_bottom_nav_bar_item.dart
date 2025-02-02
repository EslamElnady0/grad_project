import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../cubit/bottom_nav_bar_cubit.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  final String title;
  final int index;
  final String iconPath;
  const CustomBottomNavBarItem(
      {super.key,
      required this.title,
      required this.index,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<BottomNavBarCubit>().changeIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            height: index == 0 ? 23.h : 22.h,
            colorFilter: ColorFilter.mode(
                context.read<BottomNavBarCubit>().currentIndex == index
                    ? AppColors.primaryColorlight
                    : AppColors.gray,
                BlendMode.srcIn),
          ),
          vGap(9),
          Text(
            title,
            style: AppTextStyles.font10greenRegular.copyWith(
              color: context.read<BottomNavBarCubit>().currentIndex == index
                  ? AppColors.primaryColordark
                  : AppColors.gray,
            ),
          )
        ],
      ),
    );
  }
}
