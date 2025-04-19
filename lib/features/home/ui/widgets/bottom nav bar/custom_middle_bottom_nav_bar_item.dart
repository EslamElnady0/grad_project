import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../cubit/bottom_nav_bar_cubit.dart';

class CustomMiddleBottomNavBarItem extends StatelessWidget {
  final String icon;
  final int index;
  const CustomMiddleBottomNavBarItem(
      {super.key, required this.icon, required this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 12.h,
          right: 8.5.w,
        ),
        child: GestureDetector(
          onTap: () {
            context.read<BottomNavBarCubit>().changeIndex(index);
          },
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleAvatar(
                radius: 38.r,
                backgroundColor:
                    context.read<BottomNavBarCubit>().currentIndex == index
                        ? AppColors.primaryColordark
                        : AppColors.lightGreen,
              ),
              Container(
                padding: EdgeInsets.all(22.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.read<BottomNavBarCubit>().currentIndex == index
                      ? AppColors.white
                      : null,
                  gradient:
                      context.read<BottomNavBarCubit>().currentIndex == index
                          ? null
                          : Constants.primaryGrad,
                ),
                child: SvgPicture.asset(
                  icon,
                  height: 22.h,
                  colorFilter:
                      context.read<BottomNavBarCubit>().currentIndex == index
                          ? null
                          : const ColorFilter.mode(
                              AppColors.white, BlendMode.srcIn),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
