import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../cubit/bottom_nav_bar_cubit.dart';
import '../../models/bottom_nav_bar_item_model.dart';
import 'custom_bottom_nav_bar_item.dart';

class CustomStudentBottomNavigationBar extends StatelessWidget {
  const CustomStudentBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomNavBarItemModel> bottomNavBarItems =
        Constants.bottomNavBarItemsLocalized(context);
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 71.h,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(right: 17.w, left: 17.w, top: 12.h),
          decoration: BoxDecoration(
            color: AppColors.darkblue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          foregroundDecoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CustomBottomNavBarItem(
                    title: bottomNavBarItems[index].title,
                    index: index,
                    iconPath: bottomNavBarItems[index].iconPath,
                  ),
              separatorBuilder: (context, index) => hGap(30),
              itemCount: 4),
        );
      },
    );
  }
}
