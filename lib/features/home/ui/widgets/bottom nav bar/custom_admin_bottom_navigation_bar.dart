import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../cubit/bottom_nav_bar_cubit.dart';
import '../../models/bottom_nav_bar_item_model.dart';
import 'custom_bottom_nav_bar_item.dart';
import 'custom_middle_bottom_nav_bar_item.dart';

class CustomAdminBottomNavigationBar extends StatelessWidget {
  const CustomAdminBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomNavBarItemModel> adminBottomNavBarItems =
        Constants.adminBottomNavBarItemsLocalized(context);
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(Assets.imagesBottomNavBarBg),
            Container(
              padding: EdgeInsets.only(
                  right: 15.w, left: 15.w, top: 12.h, bottom: 7.h),
              child: Row(
                children: [
                  CustomBottomNavBarItem(
                    title: adminBottomNavBarItems[0].title,
                    index: 0,
                    iconPath: adminBottomNavBarItems[0].iconPath,
                  ),
                  hGap(20),
                  CustomBottomNavBarItem(
                    title: adminBottomNavBarItems[1].title,
                    index: 1,
                    iconPath: adminBottomNavBarItems[1].iconPath,
                  ),
                  const Spacer(),
                  CustomBottomNavBarItem(
                    title: adminBottomNavBarItems[3].title,
                    index: 3,
                    iconPath: adminBottomNavBarItems[3].iconPath,
                  ),
                  isArabicLocale(context) ? hGap(20) : hGap(15),
                  CustomBottomNavBarItem(
                    title: adminBottomNavBarItems[4].title,
                    index: 4,
                    iconPath: adminBottomNavBarItems[4].iconPath,
                  ),
                ],
              ),
            ),
            CustomMiddleBottomNavBarItem(
              icon: adminBottomNavBarItems[2].iconPath,
              index: 2,
            )
          ],
        );
      },
    );
  }
}
